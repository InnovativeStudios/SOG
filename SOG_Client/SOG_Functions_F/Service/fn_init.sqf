/*
 * Name:	sog_fnc_serviceVehicle
 * Date:	8/6/2022
 * Version: 1.0
 * Author:  J. Schmidt
 *
 * Description:
 * Repair specific type(s) of vehicle(s).
 *
 * Parameter(s):
 * 0: Vehicle that is being repaired. <OBJECT> 
 * 1: Type of vehicle that is being repaired. <STRING>
 *
 * Example(s):
 * ["landVehicle"] spawn SOGServiceVehicle;
 *
 * Trigger Example(s):
 * Condition: call { {_x iskindOf "plane" && speed _x < 1} count thisList > 0; };
 * On Activation: call { _handle = [(thisList select 0), "plane"] spawn SOGServiceVehicle; };
 */

 execVM "\SOG\SOG_Functions_F\Service\scripts\service.sqf";
