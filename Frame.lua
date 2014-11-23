SLASH_LEFOLLOWERS1, SLASH_LEFOLLOWERS2 = '/le', '/lefollowers'; -- 3.
function SlashCmdList.LEFOLLOWERS(msg, editbox) -- 4.
	FList()
	Frame1:Show();
end

function FList()
 FollowerString = "";
 followersList = C_Garrison.GetFollowers();
 followerCount = 0;
 timedIcon = "Interface\\ICONS\\SPELL_HOLY_BORROWEDTIME.BLP";
 timedText = "Timed Battle";
 timedcount = 0;
 deadlyIcon = "Interface\\ICONS\\Achievement_Boss_TwinOrcBrutes.blp";
 deadlycount = 0;
 deadlyText = "Deadly Minions"
 powerfullIcon = "Interface\\ICONS\\Spell_Shadow_ShadowBolt.blp";
 powerfullcount = 0;
 powerfullText = "Powerful Spell"
 minionIcon = "Interface\\ICONS\\Spell_DeathKnight_ArmyOfTheDead.blp";
 minioncount = 0;
 minionText = "Minion Swarms"
 dangerIcon = "Interface\\ICONS\\spell_Shaman_Earthquake.blp";
 dangercount = 0;
 dangerText = "Danger Zones"
 wildIcon = "Interface\\ICONS\\Spell_Nature_Reincarnation.blp";
 wildcount = 0;
 wildText = "Wild Aggression"
 massiveIcon = "Interface\\ICONS\\Ability_Warrior_SavageBlow.blp";
 massivecount = 0;
 massiveText = "Massive Strike"
 groupIcon = "Interface\\ICONS\\Spell_Fire_SelfDestruct.blp";
 groupcount = 0; 
 groupText = "Group Damage"
 magicIcon = "Interface\\ICONS\\Spell_Shadow_ShadowWordPain.blp";
 magiccount = 0; 
 magicText = "Magic Debuff"


 totals2 = ""
 totals1 = ""
 
 	for i = 1, #followersList do
		if(followersList[i].isCollected) then
			followerCount = followerCount + 1
			counters = ""
			followerAbilities = C_Garrison.GetFollowerAbilities(followersList[i].followerID);
			for a = 1, #followerAbilities do
				ability = followerAbilities[a];
				if ( not ability.isTrait ) then
					for id, counter in pairs(ability.counters) do
						counters = string.format("%s \124T%s:0:0:2:0\124t", counters, counter.icon);
						if ( followersList[i].status ~= GARRISON_FOLLOWER_INACTIVE ) then
							if ( counter.name == "Wild Aggression" ) then -- check if counter is for Wild Aggression
								wildcount = wildcount + 1; -- adding 1 to total
								--wildIcon = counter.icon;
							end

							if ( counter.name == "Massive Strike" ) then -- check if counter is for Massive Strike
								massivecount = massivecount + 1; -- adding 1 to total
								--massiveIcon = counter.icon;
							end
						
							if ( counter.name == "Group Damage" ) then -- check if counter is for Group Damage
								groupcount = groupcount + 1; -- adding 1 to total
								--groupIcon = counter.icon;
							end

							if ( counter.name == "Magic Debuff" ) then -- check if counter is for Magic Debuff
								magiccount = magiccount + 1; -- adding 1 to total
								--magicIcon = counter.icon;
							end
						
							if ( counter.name == "Timed Battle" ) then -- check if counter is for Timed Battle
								timedcount = timedcount + 1; -- adding 1 to total
								--timedIcon = counter.icon;
							end

							if ( counter.name == "Deadly Minions" ) then -- check if counter is for Deadly Minions
								deadlycount = deadlycount + 1; -- adding 1 to total
								--deadlyIcon = counter.icon;
							end
							if ( counter.name == "Powerful Spell" ) then -- check if counter is for Powerful Spell
								powerfullcount = powerfullcount + 1; -- adding 1 to total
								--powerfullIcon = counter.icon;
							end
							if ( counter.name == "Minion Swarms" ) then -- check if counter is for Minion Swarms
								minioncount = minioncount + 1; -- adding 1 to total
								--minionIcon = counter.icon;
							end
							if ( counter.name == "Danger Zones" ) then -- check if counter is for Danger Zones
								dangercount = dangercount + 1; -- adding 1 to total
								--dangerIcon = counter.icon;
							end
						end
					end
				end
			end
			if ( followersList[i].status == GARRISON_FOLLOWER_INACTIVE ) then
				FollowerString = string.format("%s%s|t:%s|n", FollowerString, ("|cff6E6E6E(" .. followersList[i].name .. ")|r"), counters);	
			else
				FollowerString = string.format("%s%s|t:%s|n", FollowerString, followersList[i].name, counters);	
			end
			abilities = C_Garrison.GetFollowerAbilities(followersList[i].followerID);
		end
	end

	totals1 = string.format("%s \124T%s:0:0:2:0\124t %s:%s |n", totals1, dangerIcon, dangerText, dangercount ); 
	totals1 = string.format("%s \124T%s:0:0:2:0\124t %s:%s |n", totals1, deadlyIcon, deadlyText, deadlycount ); 
	totals1 = string.format("%s \124T%s:0:0:2:0\124t %s:%s |n", totals1, groupIcon, groupText, groupcount ); 
	totals1 = string.format("%s \124T%s:0:0:2:0\124t %s:%s |n", totals1, magicIcon, magicText, magiccount ); 
	totals1 = string.format("%s \124T%s:0:0:2:0\124t %s:%s ", totals1, massiveIcon, massiveText, massivecount );
	
	totals2 = string.format("%s \124T%s:0:0:2:0\124t %s:%s |n", totals2, minionIcon, minionText, minioncount ); 
	totals2 = string.format("%s \124T%s:0:0:2:0\124t %s:%s |n", totals2, powerfullIcon, powerfullText, powerfullcount ); 
	totals2 = string.format("%s \124T%s:0:0:2:0\124t %s:%s |n", totals2, timedIcon, timedText, timedcount ); 	
	totals2 = string.format("%s \124T%s:0:0:2:0\124t %s:%s ", totals2, wildIcon, wildText, wildcount ); 

	FontString3:SetText(FollowerString);
	FontString1:SetText(totals1);
	FontString2:SetText(totals2);
	-- resize the frames
	FontString3:SetHeight((followerCount) * 16)
	Frame1:SetHeight((followerCount) * 16 + 165)
	
end
function FollowerFrame_OnLoad(self)
	Frame1:Hide();
end
