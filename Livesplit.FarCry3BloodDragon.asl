// Special thanks to OrdinaryNimda for splitting logic, Ero for optimizing it and helping with bug fixes, and also thanks to Marjn, M_E_T_A_L_I_S_T___S_P_1_D, and AlexYeahNot.
// Changelog
// 15.07.23: Started making ASL and figured out how MD5 Hash works with the help of Speedrunning Tools Discord.
// 16.07.23: Added Uplay MD5 Hash 1.5 from Alex's version, tested by Marjn.
// 17.07.23: Found all DX11 pointers and finished writing the ASL. Now the code can be reused.
// 18.07.23: Added DX9 1.5 support, fixed the loading pointer for DX11 1.5 as it didn't work for M_E_T_A_L_I_S_T___S_P_1_D. Also fixed the issue with side quests and Garrison splitting logic because they couldn't be completed during a loading screen.
// 21.07.23: Added Full Ubisoft Connect support, fixed load pointer for it

// Steam

state("fc3_blooddragon", "DX9 Steam 1.5")
{
    int PassedMissions : "FC3.dll", 0x012D5544, 0x24, 0x10, 0x1C, 0x50, 0x10;
    int LiberatedGarisons : "FC3.dll", 0x01888A10, 0xC0;
    int PassedPredator : "FC3.dll", 0x01873E7C, 0x90, 0x1C, 0x50, 0x160;
    int PassedHostage : "FC3.dll", 0x01888A10, 0x10, 0x1C, 0x50, 0x150;
    int Loading : "FC3.dll", 0x018435A4, 0x14, 0x30, 0x30;
}

state("fc3_blooddragon_d3d11", "DX11 Steam 1.5")
{
    int PassedMissions : "FC3_d3d11.dll", 0x018833C8, 0x10, 0x1C, 0x50, 0x10;
    int LiberatedGarisons : "FC3_d3d11.dll", 0x01898C50, 0xC0;
    int PassedPredator : "FC3_d3d11.dll", 0x0189A230, 0x10, 0x1C, 0x50, 0x160;
    int PassedHostage : "FC3_d3d11.dll", 0x018833C8, 0x10, 0x1C, 0x50, 0x150;
    int Loading : "FC3_d3d11.dll", 0x018537D4, 0x14, 0x30, 0x30;
}

// Ubisoft Connect

state("fc3_blooddragon_d3d11", "Ubisoft Connect 1.5")
{
    int PassedMissions : "FC3_d3d11.dll", 0x01E7B13C, 0x90, 0x41C, 0x50, 0x10;
    int LiberatedGarisons : "FC3_d3d11.dll", 0x01EA8BA8, 0xC0;
    int PassedPredator : "FC3_d3d11.dll", 0x01E7A448, 0x10, 0x1C, 0x50, 0x160;
    int PassedHostage : "FC3_d3d11.dll", 0x01EA8BA8, 0x10, 0x1C, 0x50, 0x150;
    int Loading : "FC3_d3d11.dll", 0x01E4908C, 0x14, 0xC, 0x70, 0x8;
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
    settings.Add("mission7", false, "I Must Break You (Check rules to manually end the run)", "missions");
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
    // Generate Hash for the game
    string MD5Hash;
    using (var md5 = System.Security.Cryptography.MD5.Create())
    using (var s = File.Open(modules.First().FileName, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
    MD5Hash = md5.ComputeHash(s).Select(x => x.ToString("X2")).Aggregate((a, b) => a + b);
    print("Hash is: " + MD5Hash);

    // Set game version according to hash
    switch (MD5Hash){
        case "7A1169F819C39ACA584AB2B8EE4A1D4E": version = "DX9 Steam 1.5"; break;
        case "A64723A58759D92F9C7B11ECE257A361": version = "DX11 Steam 1.5"; break;
        case "F9EEEB7309144276C34257C91E6C4875": version = "Ubisoft Connect 1.5"; break;

        default: version = "Unknown Version"; break;
    }
}

split
{
return
    current.PassedMissions == old.PassedMissions + 1
      && current.PassedMissions > 0 && current.PassedMissions < 7
      && settings["mission" + current.PassedMissions]
    || current.LiberatedGarisons == old.LiberatedGarisons + 1
      && current.LiberatedGarisons > 0 && current.LiberatedGarisons < 13 && current.Loading == 0
      && settings["garison" + current.LiberatedGarisons]
    || current.PassedHostage == old.PassedHostage + 1
      && current.PassedHostage > 0 && current.PassedHostage < 8 && current.Loading == 0
      && settings["hostage" + current.PassedHostage]
    || current.PassedPredator == old.PassedPredator + 1
      && current.PassedPredator > 0 && current.PassedPredator < 8 && current.Loading == 0
      && settings["predator" + current.PassedPredator];
}

isLoading
{
    return current.Loading == 2;
}