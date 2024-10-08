rule Win32_Trojan_IsaacWiper : tc_detection malicious
{
    meta:

        author              = "ReversingLabs"

        source              = "ReversingLabs"
        status              = "RELEASED"
        sharing             = "TLP:WHITE"
        category            = "MALWARE"
        malware             = "ISAACWIPER"
        description         = "Yara rule that detects IsaacWiper trojan."

        tc_detection_type   = "Trojan"
        tc_detection_name   = "IsaacWiper"
        tc_detection_factor = 5

    strings:
        $enumerate_physical_drives = {
            55 8B EC 81 EC ?? ?? ?? ?? 53 56 33 F6 89 55 ?? 57 89 4D ?? B3 ?? C7 45 ?? ?? ?? ?? 
            ?? 89 75 ?? 84 DB 0F 84 ?? ?? ?? ?? 8B D6 8D 4D ?? E8 ?? ?? ?? ?? 84 C0 0F 84 ?? ?? 
            ?? ?? 6A ?? 68 ?? ?? ?? ?? BA ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? E8 ?? ?? ?? ?? D1 E8 8D 
            8D ?? ?? ?? ?? BF ?? ?? ?? ?? 89 45 ?? 2B F8 83 C4 ?? 66 83 7D ?? ?? 8D 0C 41 8D 45 
            ?? 74 ?? 83 C0 ?? 66 83 38 ?? 75 ?? 8D 55 ?? 2B C2 D1 F8 8D 04 45 ?? ?? ?? ?? 50 8B 
            C2 8D 14 3F 50 E8 ?? ?? ?? ?? D1 E8 83 C4 ?? 3B C7 8D 48 ?? 0F 46 C1 8B 4D ?? 03 C8 
            89 4D ?? 83 F9 ?? 73 ?? 8B 3D ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 6A ?? 6A ?? 6A ?? 6A ?? 
            6A ?? 68 ?? ?? ?? ?? 50 B3 ?? FF D7 83 F8 ?? 74 ?? 46 50 89 75 ?? FF 15 ?? ?? ?? ?? 
            E9 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 83 F8 ?? 74 ?? 32 DB E9 ?? ?? ?? ?? 68 ?? ?? ?? ?? 
            8D 85 ?? ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 3D ?? ?? ?? ?? 0F 83 
            ?? ?? ?? ?? 0F B7 85 ?? ?? ?? ?? 66 85 C0 0F 95 C1 66 85 C0 0F 84 ?? ?? ?? ?? 6A ?? 
            68 ?? ?? ?? ?? BA ?? ?? ?? ?? 66 89 45 ?? 8D 4D ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? 
            ?? ?? ?? E8 ?? ?? ?? ?? D1 E8 8D 4D ?? BE ?? ?? ?? ?? 89 45 ?? 2B F0 83 C4 ?? 66 83 
            7D ?? ?? 8D 0C 41 8D 45 ?? 74 ?? 83 C0 ?? 66 83 38 ?? 75 ?? 8D 55 ?? 2B C2 D1 F8 8D 
            04 45 ?? ?? ?? ?? 50 8B C2 8D 14 36 50 E8 ?? ?? ?? ?? D1 E8 83 C4 ?? 3B C6 8D 48 ?? 
            0F 46 C1 8B 4D ?? 03 C8 89 4D ?? 83 F9 ?? 0F 83 ?? ?? ?? ?? 6A ?? 6A ?? 6A ?? 6A ?? 
            6A ?? 68 ?? ?? ?? ?? 8D 45 ?? 50 FF D7 8B F0 83 FE ?? 0F 84 ?? ?? ?? ?? 6A ?? 8D 45 
            ?? C7 45 ?? ?? ?? ?? ?? 50 6A ?? 8D 45 ?? 50 6A ?? 6A ?? 68 ?? ?? ?? ?? 56 FF 15 ?? 
            ?? ?? ?? 83 F8 ?? 0F 94 C3 75 ?? 33 C0 83 7D ?? ?? 0F 44 45 ?? 89 45 ?? 56 FF 15 ?? 
            ?? ?? ?? 84 DB EB ?? 84 C9 0F 84 ?? ?? ?? ?? 8B 5D ?? 8B D3 8B 4D ?? 6A ?? E8 ?? ?? 
            ?? ?? 8B 7D ?? 8A C8 83 C4 ?? 33 F6 84 C9 74 ?? 3B F3 74 ?? 6A ?? 8B D6 8B CF E8 ?? 
            ?? ?? ?? 8A C8 83 C4 ?? 46 83 C7 ?? 84 C9 75 ?? 46 84 C9 74 ?? 8B 5D ?? 3B F3 73 ?? 
            6A ?? 8B D6 8B CF E8 ?? ?? ?? ?? 8A C8 83 C4 ?? 46 83 C7 ?? 84 C9 75 ?? 8A C1 5F 5E 
            5B 8B E5 5D C3
        }

        $corrupt_drive_thread = {
            55 8B EC 83 E4 ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 53 8B 5D ?? 56 57 85 DB 0F 84 ?? ?? 
            ?? ?? 83 7B ?? ?? 0F 85 ?? ?? ?? ?? 8B 43 ?? 8D 4C 24 ?? 03 C0 BA ?? ?? ?? ?? 50 53 
            E8 ?? ?? ?? ?? 8B 3D ?? ?? ?? ?? 83 C4 ?? D1 E8 33 C9 66 89 4C 44 ?? 8D 44 24 ?? 50 
            FF D7 8B 35 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? 8D 44 24 ?? 50 FF D6 6A ?? 8D 44 24 ?? 50 
            FF 15 ?? ?? ?? ?? 6A ?? 8D 44 24 ?? 50 FF 15 ?? ?? ?? ?? 66 83 7C 24 ?? ?? 8D 44 24 
            ?? 74 ?? 90 83 C0 ?? 66 83 38 ?? 75 ?? 8D 4C 24 ?? BA ?? ?? ?? ?? 2B C1 D1 F8 8D 04 
            45 ?? ?? ?? ?? 50 8B C1 8D 8C 24 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 83 C4 ?? 8D 84 24 ?? 
            ?? ?? ?? 50 FF D7 50 68 ?? ?? ?? ?? 8D 84 24 ?? ?? ?? ?? 50 FF D6 6A ?? 6A ?? 6A ?? 
            6A ?? 6A ?? 68 ?? ?? ?? ?? 8D 84 24 ?? ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 8B F0 89 74 24 
            ?? 83 FE ?? 0F 84 ?? ?? ?? ?? 8B 7B ?? 8B 5B ?? C7 44 24 ?? ?? ?? ?? ?? 85 DB 75 ?? 
            81 FF ?? ?? ?? ?? 0F 82 ?? ?? ?? ?? C7 84 24 ?? ?? ?? ?? ?? ?? ?? ?? FF 15 ?? ?? ?? 
            ?? 89 84 24 ?? ?? ?? ?? B8 ?? ?? ?? ?? 8B 8C 84 ?? ?? ?? ?? 8B D1 C1 EA ?? 33 D1 69 
            CA ?? ?? ?? ?? 03 C8 89 8C 84 ?? ?? ?? ?? 40 3D ?? ?? ?? ?? 72 ?? BA ?? ?? ?? ?? 8D 
            B4 24 ?? ?? ?? ?? 89 94 24 ?? ?? ?? ?? 0F 1F 80 ?? ?? ?? ?? 81 FA ?? ?? ?? ?? 75 ?? 
            8D 8C 24 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 94 24 ?? ?? ?? ?? 8B 8C 94 ?? ?? ?? ?? 8B C1 
            C1 E8 ?? 42 33 C8 89 94 24 ?? ?? ?? ?? 8B C1 25 ?? ?? ?? ?? C1 E0 ?? 33 C8 8B C1 25 
            ?? ?? ?? ?? C1 E0 ?? 33 C8 8B C1 C1 E8 ?? 33 C1 89 06 83 C6 ?? 8D 84 24 ?? ?? ?? ?? 
            3B F0 72 ?? 8B 74 24 ?? 8D 44 24 ?? 6A ?? 50 68 ?? ?? ?? ?? 8D 84 24 ?? ?? ?? ?? 50 
            56 FF 15 ?? ?? ?? ?? 85 C0 74 ?? 8B 44 24 ?? 3D ?? ?? ?? ?? 75 ?? 2B F8 83 DB ?? E9 
            ?? ?? ?? ?? 8B C7 0B C3 74 ?? 57 8D 8C 24 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 8D 44 
            24 ?? 6A ?? 50 57 8D 84 24 ?? ?? ?? ?? 50 56 FF 15 ?? ?? ?? ?? 56 FF 15 ?? ?? ?? ?? 
            5F 5E 33 C0 5B 8B E5 5D C2
        }

    condition:
        uint16(0) == 0x5A4D and
        (
            $enumerate_physical_drives and $corrupt_drive_thread
        )
}