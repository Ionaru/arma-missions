(missionNamespace getVariable "CustomRadioChannel") radioChannelAdd [gatekeeper];

[gatekeeper, [missionNamespace getVariable "CustomRadioChannel", "开门!   [ Open the gates! ]"]] remoteExec ["customChat"];
sleep 2.5;
gate1 animate ["Door_1_rot", 1];
sleep 1.5;
gate2 animate ["Door_1_rot", 1];
