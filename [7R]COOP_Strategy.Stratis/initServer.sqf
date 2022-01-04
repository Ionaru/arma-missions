while {true} do {

    private _enemies = units east;

    {
        private _enemy = _x;
        private _dextro = "76561197979761992" call BIS_fnc_getUnitByUid;
        if (!isNil "_dextro") then {
            try {
                _enemy reveal _dextro;
                _enemy doTarget _dextro;
                _enemy doFire _dextro;
            } catch {
                // Fail silently
            }
        }

    } forEach _enemies;

    sleep 30; // recheck every 30 secs
};
