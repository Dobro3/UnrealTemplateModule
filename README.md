# Unreal Template Module script
This is a basic script for creating a blank Unreal engine module.

Instruction:
- Place CreateUEModule.sh in your project's Source folder.
- Run shell script (on windows you can use Git bash).
- Enter the name of module you want to create (without "Module" at the end).
- Delete script afterwards.
- RMB on project's .uproject file -> Generate Visual studio project files.
- Done.

You either can just run it anywhere and place created folder in project's Source folder. 

# Notes:
- No checks at all, really primitive script.
- On Linux systems you'll probably need to add access specifications manually. 
- There are "Core" "CoreUObject" and "Engine" dependencies in build.cs file, you might want not to use all of them (Idk, Core and CoreUObject kinda necessary).
