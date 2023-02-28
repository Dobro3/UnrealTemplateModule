
ModuleName=""
echo "Enter Unreal module name:"
read ModuleName

mkdir ./$ModuleName
mkdir ./$ModuleName/Public
mkdir ./$ModuleName/Private


# Module build.cs file should look like it
BuildCSText="using UnrealBuildTool;

public class "$ModuleName"Module : ModuleRules
{
	public "$ModuleName"Module(ReadOnlyTargetRules Target) : base(Target)
	{
		PCHUsage = ModuleRules.PCHUsageMode.UseExplicitOrSharedPCHs;
		
		PrivateDependencyModuleNames.AddRange(new string[] { \"Core\", \"CoreUObject\" });
		
		PublicDependencyModuleNames.AddRange(new string[] { \"Engine\" });
	}
}"

touch ./$ModuleName/$ModuleName"Module.Build.cs"
echo "$BuildCSText" > ./$ModuleName/$ModuleName"Module.Build.cs"


#Module header is like this 
ModuleHeader="#pragma once

#include \"CoreMinimal.h\"
#include \"Modules/ModuleManager.h\"

class F"$ModuleName"Module : public IModuleInterface
{
	virtual void StartupModule() override;
	virtual void ShutdownModule() override;
};
"

touch ./"$ModuleName"/Public/"$ModuleName"Module.h
echo "$ModuleHeader" > ./"$ModuleName"/Public/"$ModuleName"Module.h

#Module cpp file is like this
ModuleCPP="#include \""$ModuleName"Module.h\"

#define LOCTEXT_NAMESPACE F"$ModuleName"Module

void F"$ModuleName"Module::StartupModule()
{
	IModuleInterface::StartupModule();
}

void F"$ModuleName"Module::ShutdownModule()
{
	IModuleInterface::ShutdownModule();
} 

#undef LOCTEXT_NAMESPACE

IMPLEMENT_MODULE(F"$ModuleName"Module, "$ModuleName"Module);
"
touch ./"$ModuleName"/Private/"$ModuleName"Module.cpp
echo "$ModuleCPP" > ./"$ModuleName"/Private/"$ModuleName"Module.cpp

echo "Module created!"
read
