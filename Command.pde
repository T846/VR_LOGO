class Command{
  Command parentCommand;
  ArrayList<Command> childrenCommand;
  int accessChildNum = 0;
  String commandLine;
  int counter = 0;
  int conditional = 0;
  
  Command(){//dummy for originof code
    childrenCommand = new ArrayList<Command>();
  };
  Command( String cmdLine, Command pCmd){
    parentCommand = pCmd;
    commandLine = cmdLine;
    childrenCommand = new ArrayList<Command>();
  }
  
  Command getParent(){
    return parentCommand;
  }
  
  Command getChild(int i){
    return childrenCommand.get(i);
  }
  
  String getCommandline(int i){
     return commandLine;
  }
  
  void addChild(Command cmd){
    childrenCommand.add(cmd);
  }
  
  void resetCounter(){
    counter = 0;
  }
  
  void setConditional(int c){
    conditional = c;
  }
  
  void testRun(){
    println(commandLine);
    for( Command cmd : childrenCommand ){
      cmd.testRun();
    }
  }
  
  Command run(){
    if(childrenCommand.size() <= 0){ //FOWARD, BACK, RIGHT, LEFT, END
      //println( ":" + commandLine + " return " + parentCommand.commandLine + "("+ parentCommand.accessChildNum + "/" + parentCommand.childrenCommand.size() +")" );
      if( accessChildNum == 0 ){
        accessChildNum++;
        return this;
      }else{
        accessChildNum = 0;
        return parentCommand;
      }
    }
    else{ //FOR,dummy
      //if( accessChildNum == 0 ) println( "<" + commandLine + " : " + childrenCommand.size() + ">");
      if( accessChildNum < childrenCommand.size() ){
        accessChildNum++;
        //println("　"+ accessChildNum + "/" + childrenCommand.size() +"：" + commandLine );
        return childrenCommand.get(accessChildNum-1).run();
      }else{
        counter++;
        if( counter < conditional ){
          accessChildNum = 0;
          return this;
        }
        else if( parentCommand != null ){
          counter = 0;
          accessChildNum = 0;
          //println( "</" + commandLine + " return " + parentCommand.commandLine + ">");
          return parentCommand;
        }else{
          //println( "</" + commandLine + " : " + childrenCommand.size() + ">" );
          return null;
        }
      }
    } 
  }
}