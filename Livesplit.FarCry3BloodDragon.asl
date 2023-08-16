// Special thanks to OrdinaryNimda for splitting logic, Ero for optimizing it and helping with bug fixes, and also thanks to Marjn, M_E_T_A_L_I_S_T___S_P_1_D, AlexYeahNot, Cash Mayo, Sviat (Discord — .sviat; Sviat#2430) for remaking MD5Hash graber for DLL files of the game.
// Changelog
// 15.07.23: Started making ASL and figured out how MD5 Hash works with the help of Speedrunning Tools Discord.
// 16.07.23: Added Uplay MD5 Hash 1.5 from Alex's version, tested by Marjn.
// 17.07.23: Found all DX11 pointers and finished writing the ASL. Now the code can be reused.
// 18.07.23: Added DX9 1.5 support, fixed the loading pointer for DX11 1.5 as it didn't work for M_E_T_A_L_I_S_T___S_P_1_D. Also fixed the issue with side quests and Garrison splitting logic because they couldn't be completed during a loading screen.
// 21.07.23: Added Full Ubisoft Connect support, fixed load pointer for it.
// 13.08.23: Figured out Ghidra, start and final split figured out for Steam DX11 & DX9. Optimized addresses and reused them where it's possible.
// 14.08.23: Found better value for Start, start with 1, cutscene 2. Feels a ton more accurate. Collectables splitting implemented, requested by AlexYeahNot. 1 May, 2013 version made.
// 15.08.23: init MD5Hash rewrite to make a check for specifically "FC3.dll" & "FC3_dd3d11" MD5 Hash, because exe one does not work like intended, it has a match MD5 with 2021 verison even tho it has diffrent pointers.
// 16.08.23: did all the versions of the game pretty much, besides dx11 "test_ch".

// Steam

state("fc3_blooddragon", "Server Fix DX9")
{
    int PassedMissions : "FC3.dll", 0x01888A10, 0x10, 0x1C, 0x50, 0x10;
    int LiberatedGarisons : "FC3.dll", 0x01888A10, 0xC0;
    int PassedPredator : "FC3.dll", 0x01888A10, 0x10, 0x1C, 0x50, 0x160;
    int PassedHostage : "FC3.dll", 0x01888A10, 0x10, 0x1C, 0x50, 0x150;
    int TV : "FC3.dll", 0x01888A10, 0x10, 0x1C, 0x10, 0x30, 0x10, 0xC4, 0x118;
    int Notes : "FC3.dll", 0x01888A10, 0x10, 0x1C, 0x10, 0x3C, 0x10, 0xC4, 0x120;
    int VHS : "FC3.dll", 0x01888A10, 0x10, 0x1C, 0x10, 0x64, 0x10, 0xC4, 0x11C;
    int Loading : "FC3.dll", 0x018435A4, 0x14, 0x30, 0x30;
    int InACutsceneStart : "FC3.dll", 0x018D41C8, 0x4, 0x15C, 0x14, 0xBC, 0x348;
    int InACutsceneFinal : "FC3.dll", 0x018D41C8, 0x18, 0x74, 0x14, 0x0, 0x14, 0x1C, 0x4;
}

state("fc3_blooddragon_d3d11", "Server Fix DX11")
{
    int PassedMissions : "FC3_d3d11.dll", 0x01898C50, 0x10, 0x1C, 0x50, 0x10;
    int LiberatedGarisons : "FC3_d3d11.dll", 0x01898C50, 0xC0;
    int PassedPredator : "FC3_d3d11.dll", 0x01898C50, 0x10, 0x1C, 0x50, 0x160;
    int PassedHostage : "FC3_d3d11.dll", 0x01898C50, 0x10, 0x1C, 0x50, 0x150;
    int TV : "FC3_d3d11.dll", 0x01898C50, 0x10, 0x1C, 0x10, 0x30, 0x10, 0xC4, 0x118;
    int Notes : "FC3_d3d11.dll", 0x01898C50, 0x10, 0x1C, 0x10, 0x3C, 0x10, 0xC4, 0x120;
    int VHS : "FC3_d3d11.dll", 0x01898C50, 0x10, 0x1C, 0x10, 0x64, 0x10, 0xC4, 0x11C;
    int Loading : "FC3_d3d11.dll", 0x018537D4, 0x14, 0x30, 0x30;
    int InACutsceneStart : "FC3_d3d11.dll", 0x018E4408, 0x4, 0x15C, 0x14, 0xBC, 0x348;
    int InACutsceneFinal : "FC3_d3d11.dll", 0x018E4408, 0x18, 0x74, 0x14, 0x0, 0x14, 0x1C, 0x4;
}

state("fc3_blooddragon", "DX9 Steam (01.05.2013)")
{
    int PassedMissions : "FC3.dll", 0x01E995F8, 0x10, 0x1C, 0x50, 0x10;
    int LiberatedGarisons : "FC3.dll", 0x01E995F8, 0xC0;
    int PassedPredator : "FC3.dll", 0x01E995F8, 0x10, 0x1C, 0x50, 0x160;
    int PassedHostage : "FC3.dll", 0x01E995F8, 0x10, 0x1C, 0x50, 0x150;
    int TV : "FC3.dll", 0x01E995F8, 0x10, 0x1C, 0x10, 0x30, 0x10, 0xC4, 0x118;
    int Notes : "FC3.dll", 0x01E995F8, 0x10, 0x1C, 0x10, 0x3C, 0x10, 0xC4, 0x120;
    int VHS : "FC3.dll", 0x01E995F8, 0x10, 0x1C, 0x10, 0x64, 0x10, 0xC4, 0x11C;
    int Loading : "FC3.dll", 0x01E38F8C, 0x14, 0x30, 0x30;
    int InACutsceneStart : "FC3.dll", 0x01F14AE0, 0x4, 0x15C, 0x14, 0xBC, 0x348;
    int InACutsceneFinal : "FC3.dll", 0x01F14AE0, 0x18, 0x74, 0x14, 0x0, 0x14, 0x1C, 0x4;
}

state("fc3_blooddragon_d3d11", "DX11 Steam (01.05.2013)")
{
    int PassedMissions : "FC3_d3d11.dll", 0x01EA7BA8, 0x10, 0x1C, 0x50, 0x10;
    int LiberatedGarisons : "FC3_d3d11.dll", 0x01EA7BA8, 0xC0;
    int PassedPredator : "FC3_d3d11.dll", 0x01EA7BA8, 0x10, 0x1C, 0x50, 0x160;
    int PassedHostage : "FC3_d3d11.dll", 0x01EA7BA8, 0x10, 0x1C, 0x50, 0x150;
    int TV : "FC3_d3d11.dll", 0x01EA7BA8, 0x10, 0x1C, 0x10, 0x30, 0x10, 0xC4, 0x118;
    int Notes : "FC3_d3d11.dll", 0x01EA7BA8, 0x10, 0x1C, 0x10, 0x3C, 0x10, 0xC4, 0x120;
    int VHS : "FC3_d3d11.dll", 0x01EA7BA8, 0x10, 0x1C, 0x10, 0x64, 0x10, 0xC4, 0x11C;
    int Loading : "FC3_d3d11.dll", 0x01E4808C, 0x14, 0x30, 0x30;
    int InACutsceneStart : "FC3_d3d11.dll", 0x01F23090, 0x4, 0x15C, 0x14, 0xBC, 0x348;
    int InACutsceneFinal : "FC3_d3d11.dll", 0x01F23090, 0x18, 0x74, 0x14, 0x0, 0x14, 0x1C, 0x4;
}

state("fc3_blooddragon", "DX9 Steam (16.06.2014)")
{
    int PassedMissions : "FC3.dll", 0x01E47BB0, 0x10, 0x1C, 0x50, 0x10;
    int LiberatedGarisons : "FC3.dll", 0x01E47BB0, 0xC0;
    int PassedPredator : "FC3.dll", 0x01E47BB0, 0x10, 0x1C, 0x50, 0x160;
    int PassedHostage : "FC3.dll", 0x01E47BB0, 0x10, 0x1C, 0x50, 0x150;
    int TV : "FC3.dll", 0x01E47BB0, 0x10, 0x1C, 0x10, 0x30, 0x10, 0xC4, 0x118;
    int Notes : "FC3.dll", 0x01E47BB0, 0x10, 0x1C, 0x10, 0x3C, 0x10, 0xC4, 0x120;
    int VHS : "FC3.dll", 0x01E47BB0, 0x10, 0x1C, 0x10, 0x64, 0x10, 0xC4, 0x11C;
    int Loading : "FC3.dll", 0x01E63A0C, 0x14, 0x30, 0x30;
    int InACutsceneStart : "FC3.dll", 0x01EEE708, 0x4, 0x15C, 0x14, 0xBC, 0x348;
    int InACutsceneFinal : "FC3.dll", 0x01EEE708, 0x18, 0x74, 0x14, 0x0, 0x14, 0x1C, 0x4;
}

state("fc3_blooddragon_d3d11", "DX11 Steam (16.06.2014)")
{
    int PassedMissions : "FC3_d3d11.dll", 0x01E55CB0, 0x10, 0x1C, 0x50, 0x10;
    int LiberatedGarisons : "FC3_d3d11.dll", 0x01E55CB0, 0xC0;
    int PassedPredator : "FC3_d3d11.dll", 0x01E55CB0, 0x10, 0x1C, 0x50, 0x160;
    int PassedHostage : "FC3_d3d11.dll", 0x01E55CB0, 0x10, 0x1C, 0x50, 0x150;
    int TV : "FC3_d3d11.dll", 0x01E55CB0, 0x10, 0x1C, 0x10, 0x30, 0x10, 0xC4, 0x118;
    int Notes : "FC3_d3d11.dll", 0x01E55CB0, 0x10, 0x1C, 0x10, 0x3C, 0x10, 0xC4, 0x120;
    int VHS : "FC3_d3d11.dll", 0x01E55CB0, 0x10, 0x1C, 0x10, 0x64, 0x10, 0xC4, 0x11C;
    int Loading : "FC3_d3d11.dll", 0x01E71B0C, 0x14, 0x30, 0x30;
    int InACutsceneStart : "FC3_d3d11.dll", 0x01F2C0B0, 0x4, 0x15C, 0x14, 0xBC, 0x348;
    int InACutsceneFinal : "FC3_d3d11.dll", 0x01F2C0B0, 0x18, 0x74, 0x14, 0x0, 0x14, 0x1C, 0x4;
}

state("fc3_blooddragon", "DX9 Steam (13.05.2019)")
{
    int PassedMissions : "FC3.dll", 0x01EF7448, 0x10, 0x1C, 0x50, 0x10;
    int LiberatedGarisons : "FC3.dll", 0x01EF7448, 0xC0;
    int PassedPredator : "FC3.dll", 0x01EF7448, 0x10, 0x1C, 0x50, 0x160;
    int PassedHostage : "FC3.dll", 0x01EF7448, 0x10, 0x1C, 0x50, 0x150;
    int TV : "FC3.dll", 0x01EF7448, 0x10, 0x1C, 0x10, 0x30, 0x10, 0xC4, 0x118;
    int Notes : "FC3.dll", 0x01EF7448, 0x10, 0x1C, 0x10, 0x3C, 0x10, 0xC4, 0x120;
    int VHS : "FC3.dll", 0x01EF7448, 0x10, 0x1C, 0x10, 0x64, 0x10, 0xC4, 0x11C;
    int Loading : "FC3.dll", 0x01E96F0C, 0x14, 0x30, 0x30;
    int InACutsceneStart : "FC3.dll", 0x01F72950, 0x4, 0x15C, 0x14, 0xBC, 0x348;
    int InACutsceneFinal : "FC3.dll", 0x01F72950, 0x18, 0x74, 0x14, 0x0, 0x14, 0x1C, 0x4; // TODO: DX11 Version for this, but I need to refind pointers here, because they seem to be different
}

state("fc3_blooddragon", "DX9 Steam/Connect (29.11.2021)") // I'm not sure if you can launch DX9 Connect, but if you somehow can, it has all the same addresses and MD5 as Steam version DX9, so that's might be why it does not launch?
{
    int PassedMissions : "FC3.dll", 0x01888A10, 0x10, 0x1C, 0x50, 0x10;
    int LiberatedGarisons : "FC3.dll", 0x01888A10, 0xC0;
    int PassedPredator : "FC3.dll", 0x01888A10, 0x10, 0x1C, 0x50, 0x160;
    int PassedHostage : "FC3.dll", 0x01888A10, 0x10, 0x1C, 0x50, 0x150;
    int TV : "FC3.dll", 0x01888A10, 0x10, 0x1C, 0x10, 0x30, 0x10, 0xC4, 0x118;
    int Notes : "FC3.dll", 0x01888A10, 0x10, 0x1C, 0x10, 0x3C, 0x10, 0xC4, 0x120;
    int VHS : "FC3.dll", 0x01888A10, 0x10, 0x1C, 0x10, 0x64, 0x10, 0xC4, 0x11C;
    int Loading : "FC3.dll", 0x018435A4, 0x14, 0x30, 0x30;
    int InACutsceneStart : "FC3.dll", 0x018D41C8, 0x4, 0x15C, 0x14, 0xBC, 0x348;
    int InACutsceneFinal : "FC3.dll", 0x018D41C8, 0x18, 0x74, 0x14, 0x0, 0x14, 0x1C, 0x4;
}

state("fc3_blooddragon_d3d11", "DX11 Steam (29.11.2021)")
{
    int PassedMissions : "FC3_d3d11.dll", 0x01898C50, 0x10, 0x1C, 0x50, 0x10;
    int LiberatedGarisons : "FC3_d3d11.dll", 0x01898C50, 0xC0;
    int PassedPredator : "FC3_d3d11.dll", 0x01898C50, 0x10, 0x1C, 0x50, 0x160;
    int PassedHostage : "FC3_d3d11.dll", 0x01898C50, 0x10, 0x1C, 0x50, 0x150;
    int TV : "FC3_d3d11.dll", 0x01898C50, 0x10, 0x1C, 0x10, 0x30, 0x10, 0xC4, 0x118;
    int Notes : "FC3_d3d11.dll", 0x01898C50, 0x10, 0x1C, 0x10, 0x3C, 0x10, 0xC4, 0x120;
    int VHS : "FC3_d3d11.dll", 0x01898C50, 0x10, 0x1C, 0x10, 0x64, 0x10, 0xC4, 0x11C;
    int Loading : "FC3_d3d11.dll", 0x018537D4, 0x14, 0x30, 0x30;
    int InACutsceneStart : "FC3_d3d11.dll", 0x018E4408, 0x4, 0x15C, 0x14, 0xBC, 0x348;
    int InACutsceneFinal : "FC3_d3d11.dll", 0x018E4408, 0x18, 0x74, 0x14, 0x0, 0x14, 0x1C, 0x4;
}

// Ubisoft Connect

state("fc3_blooddragon_d3d11", "Connect DX11 (29.11.2021)")   
{
    int PassedMissions : "FC3_d3d11.dll", 0x01EA8BA8, 0x10, 0x1C, 0x50, 0x10;
    int LiberatedGarisons : "FC3_d3d11.dll", 0x01EA8BA8, 0xC0;
    int PassedPredator : "FC3_d3d11.dll", 0x01EA8BA8, 0x10, 0x1C, 0x50, 0x160;
    int PassedHostage : "FC3_d3d11.dll", 0x01EA8BA8, 0x10, 0x1C, 0x50, 0x150;
    int TV : "FC3_d3d11.dll", 0x01EA8BA8, 0x10, 0x1C, 0x10, 0x30, 0x10, 0xC4, 0x118;
    int Notes : "FC3_d3d11.dll", 0x01EA8BA8, 0x10, 0x1C, 0x10, 0x3C, 0x10, 0xC4, 0x120;
    int VHS : "FC3_d3d11.dll", 0x01EA8BA8, 0x10, 0x1C, 0x10, 0x64, 0x10, 0xC4, 0x11C;
    int Loading : "FC3_d3d11.dll", 0x01E4908C, 0x14, 0x30, 0x30;
    int InACutsceneStart : "FC3_d3d11.dll", 0x01F240B0, 0x4, 0x15C, 0x14, 0xBC, 0x348;
    int InACutsceneFinal : "FC3_d3d11.dll", 0x01F240B0, 0x18, 0x74, 0x14, 0x0, 0x14, 0x1C, 0x4;
}

startup
{
    settings.Add("missions", true, "Split when completing a Main Mission:");
    settings.Add("mission1", true, "You Got Time To Duck?", "missions");
    settings.Add("mission2", true, "They're Hee-eere!", "missions");
    settings.Add("mission3", true, "Punch It", "missions");
    settings.Add("mission4", true, "What Is This Shit?", "missions");
    settings.Add("mission5", true, "I Don't Deal With Psychos. I Put 'Em Away", "missions");
    settings.Add("mission6", true, "Summon The Plague", "missions");
    settings.Add("mission7", true, "I Must Break You", "missions");
    settings.Add("garison", true, "Split when liberating a Garison:");
    settings.Add("garison1", false, "Garison 1", "garison");
    settings.Add("garison2", false, "Garison 2", "garison");
    settings.Add("garison3", false, "Garison 3", "garison");
    settings.Add("garison4", false, "Garison 4", "garison");
    settings.Add("garison5", false, "Garison 5", "garison");
    settings.Add("garison6", false, "Garison 6", "garison");
    settings.Add("garison7", false, "Garison 7", "garison");
    settings.Add("garison8", false, "Garison 8", "garison");
    settings.Add("garison9", false, "Garison 9", "garison");
    settings.Add("garison10", false, "Garison 10", "garison");
    settings.Add("garison11", false, "Garison 11", "garison");
    settings.Add("garison12", false, "Garison 12", "garison");
    settings.Add("garison13", false, "Garison 13", "garison");
    settings.Add("predator", true, "Split when completing Predator's Path:");
    settings.Add("predator1", false, "Predator's Path 1", "predator");
    settings.Add("predator2", false, "Predator's Path 2", "predator");
    settings.Add("predator3", false, "Predator's Path 3", "predator");
    settings.Add("predator4", false, "Predator's Path 4", "predator");
    settings.Add("predator5", false, "Predator's Path 5", "predator");
    settings.Add("predator6", false, "Predator's Path 6", "predator");
    settings.Add("predator7", false, "Predator's Path 7", "predator");
    settings.Add("predator8", false, "Predator's Path 8", "predator");
    settings.Add("hostage", true, "Split when completing Hostage Rescue:");
    settings.Add("hostage1", false, "Save A Nerd", "hostage");
    settings.Add("hostage2", false, "Hostage Rescue 2", "hostage");
    settings.Add("hostage3", false, "Hostage Rescue 3", "hostage");
    settings.Add("hostage4", false, "Hostage Rescue 4", "hostage");
    settings.Add("hostage5", false, "Hostage Rescue 5", "hostage");
    settings.Add("hostage6", false, "Hostage Rescue 6", "hostage");
    settings.Add("hostage7", false, "Hostage Rescue 7", "hostage");
    settings.Add("hostage8", false, "Hostage Rescue 8", "hostage");
    settings.Add("TV", false, "Split when grabing Television Sets:");
    settings.Add("TV1", false, "TV 1", "TV");
    settings.Add("TV2", false, "TV 2", "TV");
    settings.Add("TV3", false, "TV 3", "TV");
    settings.Add("TV4", false, "TV 4", "TV");
    settings.Add("TV5", false, "TV 5", "TV");
    settings.Add("TV6", false, "TV 6", "TV");
    settings.Add("TV7", false, "TV 7", "TV");
    settings.Add("TV8", false, "TV 8", "TV");
    settings.Add("TV9", false, "TV 9", "TV");
    settings.Add("TV10", false, "TV 10", "TV");
    settings.Add("TV11", false, "TV 11", "TV");
    settings.Add("TV12", false, "TV 12", "TV");
    settings.Add("TV13", false, "TV 13", "TV");
    settings.Add("TV14", false, "TV 14", "TV");
    settings.Add("TV15", false, "TV 15", "TV");
    settings.Add("TV16", false, "TV 16", "TV");
    settings.Add("TV17", false, "TV 17", "TV");
    settings.Add("TV18", false, "TV 18", "TV");
    settings.Add("TV19", false, "TV 19", "TV");
    settings.Add("TV20", false, "TV 20", "TV");
    settings.Add("TV21", false, "TV 21", "TV");
    settings.Add("TV22", false, "TV 22", "TV");
    settings.Add("TV23", false, "TV 23", "TV");
    settings.Add("TV24", false, "TV 24", "TV");
    settings.Add("TV25", false, "TV 25", "TV");
    settings.Add("TV26", false, "TV 26", "TV");
    settings.Add("TV27", false, "TV 27", "TV");
    settings.Add("TV28", false, "TV 28", "TV");
    settings.Add("TV29", false, "TV 29", "TV");
    settings.Add("TV30", false, "TV 30", "TV");
    settings.Add("TV31", false, "TV 31", "TV");
    settings.Add("TV32", false, "TV 32", "TV");
    settings.Add("notes", false, "Split when grabing Dr.Carlyle's Notes:");
    settings.Add("notes1", false, "Dr.Carlyle Note 1", "notes");
    settings.Add("notes2", false, "Dr.Carlyle Note 2", "notes");
    settings.Add("notes3", false, "Dr.Carlyle Note 3", "notes");
    settings.Add("notes4", false, "Dr.Carlyle Note 4", "notes");
    settings.Add("notes5", false, "Dr.Carlyle Note 5", "notes");
    settings.Add("notes6", false, "Dr.Carlyle Note 6", "notes");
    settings.Add("notes7", false, "Dr.Carlyle Note 7", "notes");
    settings.Add("notes8", false, "Dr.Carlyle Note 8", "notes");
    settings.Add("notes9", false, "Dr.Carlyle Note 9", "notes");
    settings.Add("notes10", false, "Dr.Carlyle Note 10", "notes");
    settings.Add("VHS", false, "Split when grabing VHS Tapes:");
    settings.Add("VHS1", false, "VHS 1", "VHS");
    settings.Add("VHS2", false, "VHS 2", "VHS");
    settings.Add("VHS3", false, "VHS 3", "VHS");
    settings.Add("VHS4", false, "VHS 4", "VHS");
    settings.Add("VHS5", false, "VHS 5", "VHS");
    settings.Add("VHS6", false, "VHS 6", "VHS");
    settings.Add("VHS7", false, "VHS 7", "VHS");
    settings.Add("VHS8", false, "VHS 8", "VHS");
    settings.Add("VHS9", false, "VHS 9", "VHS");
    settings.Add("VHS10", false, "VHS 10", "VHS");
    settings.Add("VHS11", false, "VHS 11", "VHS");
    settings.Add("VHS12", false, "VHS 12", "VHS");
    
    
// This is to check if you have Compare Against -> Real Time instead of Game Time
    if (timer.CurrentTimingMethod == TimingMethod.RealTime)
    {
        var mbox = MessageBox.Show(
            "Removing loads from Far Cry 3: Blood Dragon requires comparing against Game Time.\nWould you like to switch to it?",
            "LiveSplit | Far Cry 3: Blood Dragon",
            MessageBoxButtons.YesNo);

        if (mbox == DialogResult.Yes)
            timer.CurrentTimingMethod = TimingMethod.GameTime;
    }
}

init
{
using (FileStream gameProcess = File.Open(modules.First().FileName, FileMode.Open, FileAccess.Read, FileShare.ReadWrite)) {
        string gameProcesProcessDirectory = Path.GetDirectoryName(gameProcess.Name), gameProcessName = Path.GetFileNameWithoutExtension(gameProcess.Name);

        using (System.Security.Cryptography.MD5 md5 = System.Security.Cryptography.MD5.Create())
        using (FileStream gameProcessDLL = File.Open(gameProcesProcessDirectory + "\\" + (gameProcessName[gameProcessName.Length - 1] == '1' ? "FC3_d3d11.dll" : "FC3.dll"), FileMode.Open, FileAccess.Read, FileShare.ReadWrite)) {
          string MD5Hash = md5.ComputeHash(gameProcessDLL).Select(x => x.ToString("X2")).Aggregate((a, b) => a + b);
          
          //System.Windows.Forms.Clipboard.SetDataObject(MD5Hash); uncomment if you have encontered "Unknown Version" and send to "Vlad2D" in Discord with dll files of "FC3d3d.dll" and "FC3.dll".
          switch (MD5Hash) {
            case "D0E7782B31CDE5E4FF57D808C202D2CF": version = "Server Fix DX9"; break;
            case "0DAC3F3BE0793DC6C3F639A8A788D625": version = "Server Fix DX11"; break;
            case "C6B0C3C127CBAA1108901917CF58EA13": version = "DX9 Steam (01.05.2013)"; break;
            case "D1896F5AB8D1E386184A0E90154C6D31": version = "DX11 Steam (01.05.2013)"; break;
            case "434A3CFC254FB4B3D8298C1081882575": version = "DX9 Steam (16.06.2014)"; break;
            case "685CBFA8B1D49E3EDD8671C2B2D22D4B": version = "DX11 Steam (16.06.2014)"; break;
            case "65619774266832BAB5C373DDBF2B44A1": version = "DX9 Steam (13.05.2019)"; break; // todo: DX11 test_ch
            case "DF4FE4481AC79C61E39C24541FE3DC6F": version = "DX9 Steam/Connect (29.11.2021)"; break;
            case "6F3BF955916CB3373FC666A71588F65E": version = "DX11 Steam (29.11.2021)"; break;
            case "C060144AE2DC589CFAD459151B8FFF45": version = "Connect DX11 (29.11.2021)"; break;

            default: version = "Unknown Version"; break;
          }
        }
      }
}

start
{
    return
    current.InACutsceneStart == 1 && old.InACutsceneStart == 2
      && current.PassedMissions == 0 && current.Loading == 0;
}

split
{
return
    current.PassedMissions == old.PassedMissions + 1
      && current.PassedMissions > 0 && current.PassedMissions < 7
      && settings["mission" + current.PassedMissions]
    || old.InACutsceneFinal == 1 && current.InACutsceneFinal == 0
    && current.PassedMissions == 6 && settings["mission7"]
    || current.LiberatedGarisons == old.LiberatedGarisons + 1
      && current.LiberatedGarisons > 0 && current.LiberatedGarisons < 13 && current.Loading == 0
      && settings["garison" + current.LiberatedGarisons]
    || current.PassedPredator == old.PassedPredator + 1
      && current.PassedPredator > 0 && current.PassedPredator < 8 && current.Loading == 0
      && settings["predator" + current.PassedPredator]
    || current.PassedHostage == old.PassedHostage + 1
      && current.PassedHostage > 0 && current.PassedHostage < 8 && current.Loading == 0
      && settings["hostage" + current.PassedHostage]
    || current.TV == old.TV + 1
      && current.TV > 0 && current.TV < 32 && current.Loading == 0
      && settings["TV" + current.TV]
    || current.Notes == old.Notes + 1
      && current.Notes > 0 && current.Notes < 10 && current.Loading == 0
      && settings["notes" + current.Notes]
    || current.VHS == old.VHS + 1
      && current.VHS > 0 && current.VHS < 12 && current.Loading == 0
      && settings["VHS" + current.VHS];
}

isLoading
{
    return current.Loading == 2;
}
