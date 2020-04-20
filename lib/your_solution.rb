require "pry"

def game_hash
hashketball = {:home => 
          {:team_name => "Brooklyn Nets", 
            :colors => ["Black", "White"], 
            :players => [
              {
                :player_name => "Alan Anderson",
                  :number => 0, 
                  :shoe => 16, 
                  :points => 22, 
                  :rebounds => 12, 
                  :assists => 12, 
                  :steals => 3, 
                  :blocks => 1, 
                  :slam_dunks => 1
              },
              {
                :player_name => "Reggie Evans",
                  :number => 30, 
                  :shoe => 14, 
                  :points => 12, 
                  :rebounds => 12, 
                  :assists => 12, 
                  :steals => 12, 
                  :blocks => 12, 
                  :slam_dunks => 7
              },
              {
                :player_name => "Brook Lopez",
                  :number => 11, 
                  :shoe => 17, 
                  :points => 17, 
                  :rebounds => 19, 
                  :assists => 10, 
                  :steals => 3, 
                  :blocks => 1, 
                  :slam_dunks => 15
              },
              {
                :player_name => "Mason Plumlee", 
                  :number => 1, 
                  :shoe => 19, 
                  :points => 26, 
                  :rebounds => 11, 
                  :assists => 6, 
                  :steals => 3, 
                  :blocks => 8, 
                  :slam_dunks => 5
              },
              {
                :player_name => "Jason Terry", 
                  :number => 31, 
                  :shoe => 15, 
                  :points => 19, 
                  :rebounds => 2, 
                  :assists => 2, 
                  :steals => 4, 
                  :blocks => 11, 
                  :slam_dunks => 1
              }]
            },
            :away => 
          {:team_name => "Charlotte Hornets", 
            :colors => ["Turquoise", "Purple"], 
            :players => [
              {
                :player_name => "Jeff Adrien",
                  :number => 4, 
                  :shoe => 18, 
                  :points => 10, 
                  :rebounds => 1, 
                  :assists => 1, 
                  :steals => 2, 
                  :blocks => 7, 
                  :slam_dunks => 2
              },
              {
                :player_name => "Bismack Biyombo",
                  :number => 0, 
                  :shoe => 16, 
                  :points => 12, 
                  :rebounds => 4, 
                  :assists => 7, 
                  :steals =>22, 
                  :blocks => 15, 
                  :slam_dunks => 10
              },
              {
                :player_name => "DeSagna Diop",
                  :number => 2, 
                  :shoe => 14, 
                  :points => 24, 
                  :rebounds => 12, 
                  :assists => 12, 
                  :steals => 4, 
                  :blocks => 5, 
                  :slam_dunks => 5
              },
              {
                :player_name => "Ben Gordon",
                  :number => 8, 
                  :shoe => 15, 
                  :points => 33, 
                  :rebounds => 3, 
                  :assists => 2, 
                  :steals => 1, 
                  :blocks => 1, 
                  :slam_dunks => 0
              },
              {
                :player_name => "Kemba Walker",
                  :number => 33, 
                  :shoe => 15, 
                  :points => 6, 
                  :rebounds => 12, 
                  :assists => 12, 
                  :steals => 7, 
                  :blocks => 5, 
                  :slam_dunks => 12
              }]
            }}
end

def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
       if player_name == data[:player_name]
          return data[:points]
    end
  end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
       if player_name == data[:player_name]
          return data[:shoe]
    end
  end
  end
end

def team_colors(teamname)
  game_hash.each do |location, team_data|
    if teamname == team_data[:team_name]
      return team_data[:colors]
    end
  end
end

def team_names
  teamnames = []
  teamnames << game_hash[:home][:team_name]
  teamnames << game_hash[:away][:team_name]
  teamnames
end

def player_numbers(teamname)
  home_numbers = []
  away_numbers = []
  if teamname == game_hash[:home][:team_name]
  game_hash[:home][:players].each do |home_player_data|
        home_numbers << home_player_data[:number]
  end
      return home_numbers
    end
   if teamname == game_hash[:away][:team_name]
  game_hash[:away][:players].each do |away_player_data|
        away_numbers << away_player_data[:number]
  end
  return away_numbers
  end
end

def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
      if player_name == data[:player_name]
        data.delete(:player_name)
        return data
      end
  end
end
end

def big_shoe_rebounds
  biggest_shoe = []
  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
      biggest_shoe << data[:shoe]
    end
  end
  biggest_shoe = biggest_shoe.sort[-1]
  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
      if data[:shoe] == biggest_shoe
        return data[:rebounds]
      end
    end
  end
end

def most_points_scored
  most_points = []
  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
      most_points << data[:points]
    end
  end
  most_points = most_points.sort[-1]
  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
      if data[:points] == most_points
        return data[:player_name]
      end
    end
  end
end

def winning_team
  home_points = []
  away_points = []
  game_hash[:home][:players].each do |home_player_data|
    home_points << home_player_data[:points]
    end
    home_points = home_points.sum
      game_hash[:away][:players].each do |away_player_data|
    away_points << away_player_data[:points]
    end
    away_points = away_points.sum
    if home_points > away_points
      return game_hash[:home][:team_name]
    end
    if away_points > home_points
      return game_hash[:away][:team_name]
    end
end

def player_with_longest_name
  long_name_sum = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
      if data[:player_name].length > long_name_sum.length
        long_name_sum = data[:player_name]
      end
    end
  end
  long_name_sum
end

def player_with_most_steals
  most_steals = []
  player_steals = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
      most_steals << data[:steals]
    end
  end
  most_steals = most_steals.sort[-1]
  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
      if data[:steals] == most_steals
        player_steals = data[:player_name]
      end
    end
  end
  player_steals
end

def long_name_steals_a_ton
  player_with_longest_name == player_with_most_steals
end

###first person shooters:
##names : halo, cod, bioshock, doom, apex legends
##platform: xbox one
##games:

#game name: halo
#multiplayer: yes
#feel: sci-fi
#main character: master chief
#race: spartan
#enemies: covenant
#kills: 10,000
#wears: assault armor

#game name: call of duty
#multiplayer: yes
#feel: war
#main character: john price
#race: british
#enemies: russians
#kills: 200
#wears: camouflage

#game name: bioshock
#multiplayer: no
#feel: stealth/horror
#main character: jack
#race: white, but scientifically developed
#enemies: Splicers, Big Daddy, Little Sister
#kills: 300
#wears: Normal clothes

#game name: doom
#multiplayer: yes
#feel: blood/gore
#main character: Doom Slayer
#race: unknown
#enemies: demons
#kills: 2000
#wears: combat armor

#game name: apex legends
#multiplayer: yes
#feel: battle royale
#main character: Varies
#race: Varies
#enemies: other players
#kills: Varies
#wears: Varies

###role playing games:
##names: red dead redemption, skyrim, fallout, mass effect, final fantasy
##platform: playstation 4
##games:

#game name: red dead redemption
#multiplayer: yes
#feel: wild west
#main character: John Marston/Arthur Morgan
#race: white
#enemies: pinkertons
#kills: 200
#wears: cowboy gear

#game name: skyrim
#multiplayer: no
#feel: dragons/fantasy
#main character: Last Dragonborn
#race: humanoid
#enemies: dragons
#kills: 10
#wears: varies

#game name: fallout 4
#multiplayer: no
#feel: future/apocalyptic
#main character: Nate or Nora
#race: varies
#enemies: mutants, animals, bandits, robots
#kills: 150
#wears: varies

#game name: mass effect (not available for PS4)
#multiplayer: no
#feel: future/space
#main character: Nate or Nora
#race: varies
#enemies: mutants, animals, bandits, robots
#kills: 150
#wears: varies

#game name: The Witcher 3
#multiplayer: no
#feel: fantasy
#main character: Geralt of Rivia
#race: Witcher
#enemies: monsters
#kills: 1,000
#wears: armor


def video_game_hash
  video_games = {:first_person_shooters =>
    {:names => [
      "Halo", "Call of Duty", "Bioshock", "Doom", "Apex Legends"
    ],
        :platform => "Xbox One",
        :games => [
          {
            :game_name => "Halo",
            :multiplayer => "Yes",
            :feel => "Sci-Fi",
            :main_character => "Master Chief",
            :race => "Spartan",
            :enemies => "Covenant",
            :kills => 10000,
            :wears => "Assault Armor"
            },
          {
            :game_name => "Call of Duty",
            :multiplayer => "Yes",
            :feel => "War",
            :main_character => "Captain Price",
            :race => "British",
            :enemies => "Russians",
            :kills => 200,
            :wears => "Camouflage"
          },
          {
            :game_name => "Bioshock",
            :multiplayer => "No",
            :feel => "Stealth/Horror",
            :main_character => "Jack",
            :race => "White, but scientifically developed",
            :enemies => "Splicers, Big Daddy, Little Sister",
            :kills => 100,
            :wears => "Normal Clothes"
          },
          {
            :game_name => "Doom",
            :multiplayer => "Yes",
            :feel => "Blood/Gore",
            :main_character => "Doom Slayer",
            :race => "Unknown",
            :enemies => "Demons",
            :kills => 2000,
            :wears => "Combat Armor"
          },
          {
            :game_name => "Apex Legends",
            :multiplayer => "Yes",
            :feel => "Battle Royale",
            :main_character => "Varies",
            :race => "Varies",
            :enemies => "Other Players",
            :kills => "Varies",
            :wears => "Varies"
          }
          ]
        },
        :role_playing_games =>
        {:names => [
            "Red Dead Redemption", "Skyrim", "Fallout", "Mass Effect", "Final Fantasy"
          ],
          :platform => "Playstation 4",
          :games => [
            {
              :game_name => "Red Dead Redemption",
              :multiplayer => "Yes",
              :feel => "Wild West",
              :main_character => "John Marston/Arthur Morgan",
              :race => "White",
              :enemies => "Pinkertons",
              :kills => 200,
              :wears => "Cowboy Gear"
          },
          {
            :game_name => "Skyrim",
            :multiplayer => "No",
            :feel => "Dragons/Fantasy",
            :main_character => "Last Dragonborn",
            :race => "Humanoid",
            :enemies => "Dragons",
            :kills => 10,
            :wears => "Varies"
          },
          {
            :game_name => "Fallout 4",
            :multiplayer => "No",
            :feel => "Future/Apocolyptic",
            :main_character => "Nate or Nora",
            :race => "Varies",
            :enemies => "Mutants, Animals, Bandits, Robots",
            :kills => 150,
            :wears => "Varies"
          },
          {
            :game_name => "Mass Effect",
            :multiplayer => "No",
            :feel => "Future/Space",
            :main_character => "Commander Shepard",
            :race => "White",
            :enemies => "Reapers",
            :kills => 400,
            :wears => "N7 Armor"
          },
          {
            :game_name => "The Witcher 3",
            :multiplayer => "No",
            :feel => "Fantasy",
            :main_character => "Geralt of Rivia",
            :race => "Witcher",
            :enemies => "Monsters",
            :kills => 1000,
            :wears => "Armor"
          }
        ]
          }
        }
end

def lots_of_kills
  video_game_hash.each do |game_type, game_names|
    game_type
  end
end