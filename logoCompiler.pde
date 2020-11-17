int createCommandTree(Command parent, int lineNum, String[] code){
  int i;
  for( i = lineNum; i < code.length; i++){
    String[] tmp = code[i].split(",");
    if(    tmp[0].equals("FORWARD") || tmp[0].equals("BACK")
        || tmp[0].equals("RIGHT")   || tmp[0].equals("LEFT") ){
      parent.addChild( new Command( code[i], parent ) );
    }
    else if( tmp[0].equals("FOR") ){
      Command tmpCommand = new Command( code[i], parent );
      tmpCommand.setConditional( int(tmp[1]) );
      parent.addChild( tmpCommand );
      i = createCommandTree( tmpCommand, i+1, code  );
    }
    else if( tmp[0].equals("END") ){
      Command tmpCommand = new Command( code[i], parent );
      parent.addChild( tmpCommand );
      return i;
    }
  }
  return 0;
}

ArrayList<int[]> vrLogoCompiler(String code){
  ArrayList<int[]> commandList = new ArrayList();
  String[] tmp = code.split(",");
  int kind = 0;
  int count = 0;
  int ex = 0;
  int d = 0;
  if( tmp[0].equals("FORWARD") ){
    kind = 0;
    d = dv;
  }
  if( tmp[0].equals("BACK") ){
    kind = 1;
    d = dv;
  }
  if( tmp[0].equals("RIGHT") ){
    kind = 2;
    d = dd;
  }
  if( tmp[0].equals("LEFT") ){
    kind = 3;
    d = dd;
  }
  if( d != 0 ){
    count = int(tmp[1])/d;
    ex = int(tmp[1])%d;
  }
  
  for( int i = 0; i < count; i++ ){
    int[] command = { kind, d };
    commandList.add( command );
  }
  if( ex != 0 ){
    int[] command = { kind, ex };
    commandList.add( command );
  }
  
  return commandList;
}