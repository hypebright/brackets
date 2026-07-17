# Single elimination tournament data
tennis_data <- list(
  participant = list(
    list(id = 0, tournament_id = 0, name = "Jelena Ostapenko", image = "https://flagcdn.com/w80/lv.png"),
    list(id = 1, tournament_id = 0, name = "Coco Gauff", image = "https://flagcdn.com/w80/us.png"),
    list(id = 2, tournament_id = 0, name = "Sorana Cirstea", image = "https://flagcdn.com/w80/ro.png"),
    list(id = 3, tournament_id = 0, name = "Karolina Muchova", image = "https://flagcdn.com/w80/cz.png"),
    list(id = 4, tournament_id = 0, name = "Marketa Vondrousova", image = "https://flagcdn.com/w80/cz.png"),
    list(id = 5, tournament_id = 0, name = "Madison Keys", image = "https://flagcdn.com/w80/us.png"),
    list(id = 6, tournament_id = 0, name = "Zheng Qinwen", image = "https://flagcdn.com/w80/cn.png"),
    list(id = 7, tournament_id = 0, name = "Aryna Sabalenka", image = "https://flagcdn.com/w80/by.png")
  ),
  stage = list(
    list(
      id = 0,
      tournament_id = 0,
      name = "US Open 2023 (Finals) 🎾",
      type = "single_elimination",
      number = 1,
      settings = list(
        size = 8,
        seedOrdering = list("natural"),
        grandFinal = "simple",
        matchesChildCount = 0
      )
    )
  ),
  round = list(
    list(id = 0, number = 1, stage_id = 0, group_id = 0),
    list(id = 1, number = 2, stage_id = 0, group_id = 0),
    list(id = 2, number = 3, stage_id = 0, group_id = 0)
  ),
  match = list(
    list(
      id = 0,
      number = 1,
      stage_id = 0,
      group_id = 0,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 0, position = 20, score = 0, result = "loss"),
      opponent2 = list(id = 1, position = 6, score = 2, result = "win")
    ),
    list(
      id = 1,
      number = 2,
      stage_id = 0,
      group_id = 0,
      round_id = 0,
      child_count = 0,
      status = 3,
      opponent1 = list(id = 2, position = 30, score = 0, result = "loss"),
      opponent2 = list(id = 3, position = 10, score = 2, result = "win")
    ),
    list(
      id = 2,
      number = 3,
      stage_id = 0,
      group_id = 0,
      round_id = 0,
      child_count = 0,
      status = 0,
      opponent1 = list(id = 4, position = 9, score = 0, result = "loss"),
      opponent2 = list(id = 5, position = 17, score = 2, result = "win")
    ),
    list(
      id = 3,
      number = 4,
      stage_id = 0,
      group_id = 0,
      round_id = 0,
      child_count = 0,
      status = 2,
      opponent1 = list(id = 6, position = 23, score = 0, result = "loss"),
      opponent2 = list(id = 7, position = 2, score = 2, result = "win")
    ),
    list(
      id = 4,
      number = 1,
      stage_id = 0,
      group_id = 0,
      round_id = 1,
      child_count = 0,
      status = 3,
      opponent1 = list(id = 1, score = 2, result = "win"),
      opponent2 = list(id = 3, score = 0, result = "loss")
    ),
    list(
      id = 5,
      number = 2,
      stage_id = 0,
      group_id = 0,
      round_id = 1,
      child_count = 0,
      status = 1,
      opponent1 = list(id = 5, score = 1, result = "loss"),
      opponent2 = list(id = 7, score = 2, result = "win")
    ),
    list(
      id = 6,
      number = 1,
      stage_id = 0,
      group_id = 0,
      round_id = 2,
      child_count = 0,
      status = 0,
      # opponent1 = list(id = 1, score = 2, result = "win"),
      # opponent2 = list(id = 7, score = 1, result = "loss")
      opponent1 = list(id = NA),
      opponent2 = list(id = NA)
    )
  ),
  match_game = list()
)

# Round-Robin
soccer_data <- list(
  participant = list(
    list(id = 0, tournament_id = 0, name = "🇺🇸 United States"),
    list(id = 1, tournament_id = 0, name = "🇯🇲 Jamaica"),
    list(id = 2, tournament_id = 0, name = "🇹🇹 Trinidad and Tobago"),
    list(id = 3, tournament_id = 0, name = "🇰🇳 Saint Kitts and Nevis"),
    list(id = 4, tournament_id = 0, name = "🇲🇽 Mexico"),
    list(id = 5, tournament_id = 0, name = "🇶🇦 Qatar"),
    list(id = 6, tournament_id = 0, name = "🇭🇳 Honduras"),
    list(id = 7, tournament_id = 0, name = "🇭🇹 Haiti"),
    list(id = 8, tournament_id = 0, name = "🇵🇦 Panama"),
    list(id = 9, tournament_id = 0, name = "🇨🇷 Costa Rica"),
    list(id = 10, tournament_id = 0, name = "🇲🇶 Martinique"),
    list(id = 11, tournament_id = 0, name = "🇸🇻 El Salvador"),
    list(id = 12, tournament_id = 0, name = "🇬🇹 Guatemala"),
    list(id = 13, tournament_id = 0, name = "🇨🇦 Canada"),
    list(id = 14, tournament_id = 0, name = "🇬🇵 Guadeloupe"),
    list(id = 15, tournament_id = 0, name = "🇨🇺 Cuba")
  ),
  stage = list(
    list(
      id = 0,
      tournament_id = 0,
      name = "2023 CONCACAF Gold Cup Group Stage ⚽️",
      type = "round_robin",
      number = 1,
      settings = list(
        size = 16,
        grandFinal = "none",
        groupCount = 4,
        roundRobinMode = "simple",
        matchesChildCount = 0
      )
    )
  ),
  group = list(
    list(id = 0, stage_id = 0, number = 1),
    list(id = 1, stage_id = 0, number = 2),
    list(id = 2, stage_id = 0, number = 3),
    list(id = 3, stage_id = 0, number = 4)
  ),
  round = list(
    list(id = 0, number = 1, stage_id = 0, group_id = 0),
    list(id = 1, number = 1, stage_id = 1, group_id = 0),
    list(id = 2, number = 2, stage_id = 1, group_id = 0),
    list(id = 3, number = 3, stage_id = 1, group_id = 0)
  ),
  match = list(
    list(
      id = 0,
      number = 0,
      stage_id = 0,
      group_id = 0,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 0, score = 1, result = "draw"),
      opponent2 = list(id = 1, score = 1, result = "draw")
    ),
    list(
      id = 1,
      number = 1,
      stage_id = 0,
      group_id = 0,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 2, score = 3, result = "win"),
      opponent2 = list(id = 3, score = 0, result = "loss")
    ),
    list(
      id = 2,
      number = 2,
      stage_id = 0,
      group_id = 0,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 1, score = 4, result = "win"),
      opponent2 = list(id = 2, score = 1, result = "loss")
    ),
    list(
      id = 3,
      number = 3,
      stage_id = 0,
      group_id = 0,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 3, score = 0, result = "loss"),
      opponent2 = list(id = 0, score = 6, result = "win")
    ),
    list(
      id = 4,
      number = 4,
      stage_id = 0,
      group_id = 0,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 0, score = 6, result = "win"),
      opponent2 = list(id = 2, score = 0, result = "loss")
    ),
    list(
      id = 4,
      number = 4,
      stage_id = 0,
      group_id = 0,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 1, score = 5, result = "win"),
      opponent2 = list(id = 3, score = 0, result = "loss")
    ),
    list(
      id = 5,
      number = 5,
      stage_id = 0,
      group_id = 1,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 7, score = 2, result = "win"),
      opponent2 = list(id = 5, score = 1, result = "loss")
    ),
    list(
      id = 6,
      number = 6,
      stage_id = 0,
      group_id = 1,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 4, score = 4, result = "win"),
      opponent2 = list(id = 6, score = 0, result = "loss")
    ),
    list(
      id = 7,
      number = 7,
      stage_id = 0,
      group_id = 1,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 5, score = 1, result = "draw"),
      opponent2 = list(id = 6, score = 1, result = "draw")
    ),
    list(
      id = 8,
      number = 8,
      stage_id = 0,
      group_id = 1,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 7, score = 1, result = "loss"),
      opponent2 = list(id = 4, score = 3, result = "win")
    ),
    list(
      id = 9,
      number = 9,
      stage_id = 0,
      group_id = 1,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 6, score = 2, result = "win"),
      opponent2 = list(id = 7, score = 1, result = "loss")
    ),
    list(
      id = 10,
      number = 10,
      stage_id = 0,
      group_id = 1,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 4, score = 0, result = "loss"),
      opponent2 = list(id = 5, score = 1, result = "win")
    ),
    list(
      id = 11,
      number = 11,
      stage_id = 0,
      group_id = 2,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 11, score = 1, result = "loss"),
      opponent2 = list(id = 10, score = 2, result = "win")
    ),
    list(
      id = 12,
      number = 12,
      stage_id = 0,
      group_id = 2,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 9, score = 1, result = "loss"),
      opponent2 = list(id = 8, score = 2, result = "win")
    ),
    list(
      id = 13,
      number = 13,
      stage_id = 0,
      group_id = 2,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 10, score = 1, result = "loss"),
      opponent2 = list(id = 8, score = 2, result = "win")
    ),
    list(
      id = 14,
      number = 14,
      stage_id = 0,
      group_id = 2,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 11, score = 0, result = "draw"),
      opponent2 = list(id = 9, score = 0, result = "draw")
    ),
    list(
      id = 15,
      number = 15,
      stage_id = 0,
      group_id = 2,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 9, score = 6, result = "win"),
      opponent2 = list(id = 10, score = 4, result = "loss")
    ),
    list(
      id = 16,
      number = 16,
      stage_id = 0,
      group_id = 2,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 8, score = 2, result = "draw"),
      opponent2 = list(id = 11, score = 2, result = "draw")
    ),
    list(
      id = 17,
      number = 17,
      stage_id = 0,
      group_id = 3,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 13, score = 2, result = "draw"),
      opponent2 = list(id = 14, score = 2, result = "draw")
    ),
    list(
      id = 18,
      number = 18,
      stage_id = 0,
      group_id = 3,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 12, score = 1, result = "win"),
      opponent2 = list(id = 15, score = 0, result = "loss")
    ),
    list(
      id = 19,
      number = 19,
      stage_id = 0,
      group_id = 3,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 15, score = 1, result = "loss"),
      opponent2 = list(id = 14, score = 4, result = "win")
    ),
    list(
      id = 20,
      number = 20,
      stage_id = 0,
      group_id = 3,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 13, score = 0, result = "draw"),
      opponent2 = list(id = 12, score = 0, result = "draw")
    ),
    list(
      id = 21,
      number = 21,
      stage_id = 0,
      group_id = 3,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 14, score = 2, result = "loss"),
      opponent2 = list(id = 12, score = 3, result = "win")
    ),
    list(
      id = 22,
      number = 22,
      stage_id = 0,
      group_id = 3,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 13, score = 4, result = "win"),
      opponent2 = list(id = 15, score = 2, result = "loss")
    )
  ),
  match_game = list()
)

# Round-Robin + knockout stage
soccer_data_advanced <- list(
  participant = list(
    list(id = 0, tournament_id = 0, name = "🇺🇸 United States"),
    list(id = 1, tournament_id = 0, name = "🇯🇲 Jamaica"),
    list(id = 2, tournament_id = 0, name = "🇹🇹 Trinidad and Tobago"),
    list(id = 3, tournament_id = 0, name = "🇰🇳 Saint Kitts and Nevis"),
    list(id = 4, tournament_id = 0, name = "🇲🇽 Mexico"),
    list(id = 5, tournament_id = 0, name = "🇶🇦 Qatar"),
    list(id = 6, tournament_id = 0, name = "🇭🇳 Honduras"),
    list(id = 7, tournament_id = 0, name = "🇭🇹 Haiti"),
    list(id = 8, tournament_id = 0, name = "🇵🇦 Panama"),
    list(id = 9, tournament_id = 0, name = "🇨🇷 Costa Rica"),
    list(id = 10, tournament_id = 0, name = "🇲🇶 Martinique"),
    list(id = 11, tournament_id = 0, name = "🇸🇻 El Salvador"),
    list(id = 12, tournament_id = 0, name = "🇬🇹 Guatemala"),
    list(id = 13, tournament_id = 0, name = "🇨🇦 Canada"),
    list(id = 14, tournament_id = 0, name = "🇬🇵 Guadeloupe"),
    list(id = 15, tournament_id = 0, name = "🇨🇺 Cuba")
  ),
  stage = list(
    list(
      id = 0,
      tournament_id = 0,
      name = "2023 CONCACAF Gold Cup Group Stage ⚽️",
      type = "round_robin",
      number = 0,
      settings = list(
        size = 16,
        grandFinal = "none",
        groupCount = 4,
        roundRobinMode = "simple",
        matchesChildCount = 0
      )
    ),
    list(
      id = 1,
      tournament_id = 0,
      name = "Knockout Stage 🏆",
      type = "single_elimination",
      number = 1,
      settings = list(
        size = 8,
        seedOrdering = list("natural"),
        grandFinal = "simple",
        matchesChildCount = 0
      )
    )
  ),
  group = list(
    list(id = 0, stage_id = 0, number = 1),
    list(id = 1, stage_id = 0, number = 2),
    list(id = 2, stage_id = 0, number = 3),
    list(id = 3, stage_id = 0, number = 4)
  ),
  round = list(
    list(id = 0, number = 1, stage_id = 0, group_id = 0),
    list(id = 1, number = 2, stage_id = 0, group_id = 0),
    list(id = 2, number = 3, stage_id = 0, group_id = 0),
    list(id = 3, number = 4, stage_id = 0, group_id = 0),
    list(id = 4, number = 1, stage_id = 1, group_id = 0),
    list(id = 5, number = 2, stage_id = 1, group_id = 0),
    list(id = 6, number = 3, stage_id = 1, group_id = 0)
  ),
  match = list(
    list(
      id = 0,
      number = 0,
      stage_id = 0,
      group_id = 0,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 0, score = 1, result = "draw"),
      opponent2 = list(id = 1, score = 1, result = "draw")
    ),
    list(
      id = 1,
      number = 1,
      stage_id = 0,
      group_id = 0,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 2, score = 3, result = "win"),
      opponent2 = list(id = 3, score = 0, result = "loss")
    ),
    list(
      id = 2,
      number = 2,
      stage_id = 0,
      group_id = 0,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 1, score = 4, result = "win"),
      opponent2 = list(id = 2, score = 1, result = "loss")
    ),
    list(
      id = 3,
      number = 3,
      stage_id = 0,
      group_id = 0,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 3, score = 0, result = "loss"),
      opponent2 = list(id = 0, score = 6, result = "win")
    ),
    list(
      id = 4,
      number = 4,
      stage_id = 0,
      group_id = 0,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 0, score = 6, result = "win"),
      opponent2 = list(id = 2, score = 0, result = "loss")
    ),
    list(
      id = 4,
      number = 4,
      stage_id = 0,
      group_id = 0,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 1, score = 5, result = "win"),
      opponent2 = list(id = 3, score = 0, result = "loss")
    ),
    list(
      id = 5,
      number = 5,
      stage_id = 0,
      group_id = 1,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 7, score = 2, result = "win"),
      opponent2 = list(id = 5, score = 1, result = "loss")
    ),
    list(
      id = 6,
      number = 6,
      stage_id = 0,
      group_id = 1,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 4, score = 4, result = "win"),
      opponent2 = list(id = 6, score = 0, result = "loss")
    ),
    list(
      id = 7,
      number = 7,
      stage_id = 0,
      group_id = 1,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 5, score = 1, result = "draw"),
      opponent2 = list(id = 6, score = 1, result = "draw")
    ),
    list(
      id = 8,
      number = 8,
      stage_id = 0,
      group_id = 1,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 7, score = 1, result = "loss"),
      opponent2 = list(id = 4, score = 3, result = "win")
    ),
    list(
      id = 9,
      number = 9,
      stage_id = 0,
      group_id = 1,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 6, score = 2, result = "win"),
      opponent2 = list(id = 7, score = 1, result = "loss")
    ),
    list(
      id = 10,
      number = 10,
      stage_id = 0,
      group_id = 1,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 4, score = 0, result = "loss"),
      opponent2 = list(id = 5, score = 1, result = "win")
    ),
    list(
      id = 11,
      number = 11,
      stage_id = 0,
      group_id = 2,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 11, score = 1, result = "loss"),
      opponent2 = list(id = 10, score = 2, result = "win")
    ),
    list(
      id = 12,
      number = 12,
      stage_id = 0,
      group_id = 2,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 9, score = 1, result = "loss"),
      opponent2 = list(id = 8, score = 2, result = "win")
    ),
    list(
      id = 13,
      number = 13,
      stage_id = 0,
      group_id = 2,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 10, score = 1, result = "loss"),
      opponent2 = list(id = 8, score = 2, result = "win")
    ),
    list(
      id = 14,
      number = 14,
      stage_id = 0,
      group_id = 2,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 11, score = 0, result = "draw"),
      opponent2 = list(id = 9, score = 0, result = "draw")
    ),
    list(
      id = 15,
      number = 15,
      stage_id = 0,
      group_id = 2,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 9, score = 6, result = "win"),
      opponent2 = list(id = 10, score = 4, result = "loss")
    ),
    list(
      id = 16,
      number = 16,
      stage_id = 0,
      group_id = 2,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 8, score = 2, result = "draw"),
      opponent2 = list(id = 11, score = 2, result = "draw")
    ),
    list(
      id = 17,
      number = 17,
      stage_id = 0,
      group_id = 3,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 13, score = 2, result = "draw"),
      opponent2 = list(id = 14, score = 2, result = "draw")
    ),
    list(
      id = 18,
      number = 18,
      stage_id = 0,
      group_id = 3,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 12, score = 1, result = "win"),
      opponent2 = list(id = 15, score = 0, result = "loss")
    ),
    list(
      id = 19,
      number = 19,
      stage_id = 0,
      group_id = 3,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 15, score = 1, result = "loss"),
      opponent2 = list(id = 14, score = 4, result = "win")
    ),
    list(
      id = 20,
      number = 20,
      stage_id = 0,
      group_id = 3,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 13, score = 0, result = "draw"),
      opponent2 = list(id = 12, score = 0, result = "draw")
    ),
    list(
      id = 21,
      number = 21,
      stage_id = 0,
      group_id = 3,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 14, score = 2, result = "loss"),
      opponent2 = list(id = 12, score = 3, result = "win")
    ),
    list(
      id = 22,
      number = 22,
      stage_id = 0,
      group_id = 3,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 13, score = 4, result = "win"),
      opponent2 = list(id = 15, score = 2, result = "loss")
    ),
    list(
      id = 23,
      number = 23,
      stage_id = 1,
      group_id = 0,
      round_id = 4,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 12, score = 0, result = "loss"),
      opponent2 = list(id = 1, score = 1, result = "win")
    ),
    list(
      id = 24,
      number = 24,
      stage_id = 1,
      group_id = 0,
      round_id = 4,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 4, score = 2, result = "win"),
      opponent2 = list(id = 9, score = 0, result = "loss")
    ),
    list(
      id = 25,
      number = 25,
      stage_id = 1,
      group_id = 0,
      round_id = 4,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 0, score = 2, result = "win"),
      opponent2 = list(id = 13, score = 2, result = "loss")
    ),
    list(
      id = 26,
      number = 26,
      stage_id = 1,
      group_id = 0,
      round_id = 4,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 8, score = 4, result = "win"),
      opponent2 = list(id = 5, score = 0, result = "loss")
    ),
    list(
      id = 27,
      number = 27,
      stage_id = 1,
      group_id = 0,
      round_id = 5,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 1, score = 0, result = "loss"),
      opponent2 = list(id = 4, score = 3, result = "win")
    ),
    list(
      id = 28,
      number = 28,
      stage_id = 1,
      group_id = 0,
      round_id = 5,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 0, score = 1, result = "loss"),
      opponent2 = list(id = 8, score = 1, result = "win")
    ),
    list(
      id = 29,
      number = 29,
      stage_id = 1,
      group_id = 0,
      round_id = 6,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 4, score = 1, result = "win"),
      opponent2 = list(id = 8, score = 0, result = "loss")
    )
  ),
  match_game = list()
)