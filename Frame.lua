SLASH_LEFOLLOWERS1, SLASH_LEFOLLOWERS2 = '/le', '/lefollowers'; -- 3.
function SlashCmdList.LEFOLLOWERS(msg, editbox) -- 4.
	FList(615)
	Frame1:Show();
end

function sortNameFunction(a, b)
	-- treat IN_PARTY status as no status
	local status1 = a.status;
	--local status1 = 0;
	--if ( status1 == GARRISON_FOLLOWER_IN_PARTY ) then
	if ( status1 ~= GARRISON_FOLLOWER_INACTIVE ) then
		status1 = nil;
	end
	local status2 = b.status;
	--if ( status2 == GARRISON_FOLLOWER_IN_PARTY ) then
	if ( status2 ~= GARRISON_FOLLOWER_INACTIVE ) then
		status2 = nil;
	end		

	if ( status1 and not status2 ) then
		return false;
	elseif ( not status1 and status2 ) then
		return true;
	end

	if ( status1 ~= status2 ) then
		return status1 < status2;
	end
	
	return a.name < b.name
	--return a.status < b.status
end

function FList(filter)
 FollowerString = "";
 followersList = C_Garrison.GetFollowers();
 table.sort(followersList, sortNameFunction);
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
 timedworkcount = 0;
 deadlyworkcount = 0;
 powerfullworkcount = 0;
 minionworkcount = 0;
 dangerworkcount = 0;
 wildworkcount = 0;
 massiveworkcount = 0;
 groupworkcount = 0; 
 magicworkcount = 0; 


 totals2 = ""
 totals1 = ""
 
 	for i = 1, #followersList do
		if(followersList[i].isCollected) then
			followerCount = followerCount + 1
			counters = ""
			level = ""
			
			if ( followersList[i].level == 100) then
				level = " (" .. followersList[i].iLevel .. ")"
			else
				level = " (" .. followersList[i].level .. ")"
			end
			followerAbilities = C_Garrison.GetFollowerAbilities(followersList[i].followerID);
			for a = 1, #followerAbilities do
				ability = followerAbilities[a];
				if ( not ability.isTrait ) then
					for id, counter in pairs(ability.counters) do
						counters = string.format("%s \124T%s:0:0:2:0\124t", counters, counter.icon);
						--print(counter.description)
						if(filter == 0 or 
							(filter == 100 and followersList[i].level == 100) or
							(filter == 615 and followersList[i].iLevel >= 615) or
							(filter == 630 and followersList[i].iLevel >= 630) or
							(filter == 645 and followersList[i].iLevel >= 645)) then

							if ( followersList[i].status ~= GARRISON_FOLLOWER_INACTIVE ) then
								if ( id == 1 ) then -- check if counter is for Wild Aggression
									wildcount = wildcount + 1; -- adding 1 to total
									if ( followersList[i].status == GARRISON_FOLLOWER_WORKING) then
										wildworkcount = wildworkcount + 1;									
									end
									--wildIcon = counter.icon;
								end

								if ( id == 2 ) then -- check if counter is for Massive Strike
									massivecount = massivecount + 1; -- adding 1 to total
									if ( followersList[i].status == GARRISON_FOLLOWER_WORKING) then
										massiveworkcount = massiveworkcount + 1;
									end
									--massiveIcon = counter.icon;
								end
						
								if ( id == 3 ) then -- check if counter is for Group Damage
									groupcount = groupcount + 1; -- adding 1 to total
									if ( followersList[i].status == GARRISON_FOLLOWER_WORKING) then
										groupworkcount = groupworkcount + 1;
									end
									--groupIcon = counter.icon;
								end

								if ( id == 4 ) then -- check if counter is for Magic Debuff
									magiccount = magiccount + 1; -- adding 1 to total
									if ( followersList[i].status == GARRISON_FOLLOWER_WORKING) then
										magicworkcount = magicworkcount + 1;
									end
									--magicIcon = counter.icon;
								end
							
								if ( id == 10 ) then -- check if counter is for Timed Battle
									timedcount = timedcount + 1; -- adding 1 to total
									if ( followersList[i].status == GARRISON_FOLLOWER_WORKING) then
										timedworkcount = timedworkcount + 1;
									end
									--timedIcon = counter.icon;
								end

								if ( id == 9 ) then -- check if counter is for Deadly Minions
									deadlycount = deadlycount + 1; -- adding 1 to total
									if ( followersList[i].status == GARRISON_FOLLOWER_WORKING) then
										deadlyworkcount = deadlyworkcount + 1;
									end
									--deadlyIcon = counter.icon;
								end
								if ( id == 8 ) then -- check if counter is for Powerful Spell
									powerfullcount = powerfullcount + 1; -- adding 1 to total
									if ( followersList[i].status == GARRISON_FOLLOWER_WORKING) then
										powerfullworkcount = powerfullworkcount + 1;
									end
									--powerfullIcon = counter.icon;
								end
								if ( id == 7 ) then -- check if counter is for Minion Swarms
									minioncount = minioncount + 1; -- adding 1 to total
									if ( followersList[i].status == GARRISON_FOLLOWER_WORKING) then
										minionworkcount = minionworkcount + 1;
									end
									--minionIcon = counter.icon;
								end
								if ( id == 6 ) then -- check if counter is for Danger Zones
									dangercount = dangercount + 1; -- adding 1 to total
									if ( followersList[i].status == GARRISON_FOLLOWER_WORKING) then
										dangerworkcount = dangerworkcount + 1;
									end
									--dangerIcon = counter.icon;
								end
							end
						end
					end
				else
					if ( ability.id == 232 ) then -- check if trais is Dancer => Danger Zone
						if(filter == 0 or 
							(filter == 100 and followersList[i].level == 100) or
							(filter == 615 and followersList[i].iLevel >= 615) or
							(filter == 630 and followersList[i].iLevel >= 630) or
							(filter == 645 and followersList[i].iLevel >= 645)) then
							dangercount = dangercount + 1; -- adding 1 to total
							counters = string.format("%s \124T%s:0:0:2:0\124t", counters, 'Interface\\ICONS\\spell_Shaman_Earthquake.blp');
							if ( followersList[i].status == GARRISON_FOLLOWER_WORKING) then
								dangerworkcount = dangerworkcount + 1;
							end
						end
					end
				end
			end
			if ( followersList[i].status == GARRISON_FOLLOWER_INACTIVE ) then
				FollowerString = string.format("%s%s|t:%s|n", FollowerString, ("|cff6E6E6E" .. followersList[i].name .. level .. "|r"), counters);	
			elseif ( followersList[i].status == GARRISON_FOLLOWER_WORKING ) then
				FollowerString = string.format("%s%s|t:%s|n", FollowerString, ITEM_QUALITY_COLORS[followersList[i].quality].hex.."("..followersList[i].name..")"..level..FONT_COLOR_CODE_CLOSE, counters);	
			else
				FollowerString = string.format("%s%s|t:%s|n", FollowerString, ITEM_QUALITY_COLORS[followersList[i].quality].hex..followersList[i].name..level..FONT_COLOR_CODE_CLOSE, counters);	
			end
			abilities = C_Garrison.GetFollowerAbilities(followersList[i].followerID);
		end
	end

	totals1 = string.format("%s \124T%s:0:0:2:0\124t %s:%s |n", totals1, dangerIcon, dangerText, dangercount.."("..dangerworkcount..")" ); 
	totals1 = string.format("%s \124T%s:0:0:2:0\124t %s:%s |n", totals1, deadlyIcon, deadlyText, deadlycount.."("..deadlyworkcount..")" ); 
	totals1 = string.format("%s \124T%s:0:0:2:0\124t %s:%s |n", totals1, groupIcon, groupText, groupcount.."("..groupworkcount..")" ); 
	totals1 = string.format("%s \124T%s:0:0:2:0\124t %s:%s |n", totals1, magicIcon, magicText, magiccount.."("..magicworkcount..")" ); 
	totals1 = string.format("%s \124T%s:0:0:2:0\124t %s:%s ", totals1, massiveIcon, massiveText, massivecount.."("..massiveworkcount..")" );
	
	totals2 = string.format("%s \124T%s:0:0:2:0\124t %s:%s |n", totals2, minionIcon, minionText, minioncount.."("..minionworkcount..")" ); 
	totals2 = string.format("%s \124T%s:0:0:2:0\124t %s:%s |n", totals2, powerfullIcon, powerfullText, powerfullcount.."("..powerfullworkcount..")" ); 
	totals2 = string.format("%s \124T%s:0:0:2:0\124t %s:%s |n", totals2, timedIcon, timedText, timedcount.."("..timedworkcount..")" ); 	
	totals2 = string.format("%s \124T%s:0:0:2:0\124t %s:%s ", totals2, wildIcon, wildText, wildcount.."("..wildworkcount..")" ); 

	FontStringLeFol3:SetText(FollowerString);
	FontStringLeFol1:SetText(totals1);
	FontStringLeFol2:SetText(totals2);
	-- resize the frames
	FontStringLeFol3:SetHeight((followerCount) * 16)
	Frame1:SetHeight((followerCount) * 16 + 165)
	
end
function FollowerFrame_OnLoad(self)
	Frame1:Hide();
end
