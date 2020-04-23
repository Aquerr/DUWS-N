class Params {
    class Revive {
        title = "Revive";
        values[] = {1,0};
        texts[] = {"YES","NO"};
        default = true;
    };

    class DeathPenalty {
        title = "CP death penalty";
        values[] = {1,2,3,4,5,6,7,8,9,10,0};
        texts[] = {"1","2","3","4","5","6","7","8","9","10","No penalty"};
        default = 1;
    };

    class Stamina {
        title = "Stamina System";
        values[] = {1,0};
        texts[] = {"On","Off"};
        default = 1;
    };

    class DeadUnitsRemovalTime {
        title = "Dead Units Removal Time";
        values[] = {60, 120, 600, 1200};
        texts[] = {"1 min", "2 min", "10 min", "20 min"};
        default = 1200;
    };

    class MissionCooldownTime {
        title = "Mission Cooldown Time";
        values[] = {120, 300, 480, 600};
        texts[] = {"2min", "5min", "8min", "10 min"};
        default = 300;
    };

    #define DEBUGCONSOLE_DEFAULT 0
	#include "paramDebugConsole.hpp"

    #define TIMEACCELERATION_DEFAULT 10
	#include "paramTimeAcceleration.hpp"
}
