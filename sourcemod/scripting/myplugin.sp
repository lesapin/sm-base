#pragma semicolon 1

#include <sourcemod>

#pragma newdecls required

#define PL_VERSION "0.1.0"

public Plugin myinfo = 
{
    name        = "",
    author      = "",
    description = "",
    version     = PL_VERSION,
    url         = ""
};

public void OnPluginStart() 
{
    LogMessage("myplugin loaded");
}
