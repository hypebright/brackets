tennis_data <- list(
  participant = list(
    list(id = 0, tournament_id = 0, name = "🇱🇻 Jelena Ostapenko"),
    list(id = 1, tournament_id = 0, name = "🇺🇸 Coco Gauff"),
    list(id = 2, tournament_id = 0, name = "🇷🇴 Sorana Cirstea"),
    list(id = 3, tournament_id = 0, name = "🇨🇿 Karolina Muchova"),
    list(id = 4, tournament_id = 0, name = "🇨🇿 Marketa Vondrousova"),
    list(id = 5, tournament_id = 0, name = "🇺🇸 Madison Keys"),
    list(id = 6, tournament_id = 0, name = "🇨🇳 Zheng Qinwen"),
    list(id = 7, tournament_id = 0, name = "🇧🇾 Aryna Sabalenka")
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
      opponent1 = list(id = 1),
      opponent2 = list(id = 7)
    )
  ),
  match_game = list()
)

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
      number = 1,
      stage_id = 0,
      group_id = 0,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 0, score = 1, result = "draw"),
      opponent2 = list(id = 1, score = 1, result = "draw")
    ),
    list(
      id = 0,
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
      id = 0,
      number = 1,
      stage_id = 0,
      group_id = 0,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 1, score = 4, result = "win"),
      opponent2 = list(id = 2, score = 1, result = "loss")
    ),
    list(
      id = 0,
      number = 1,
      stage_id = 0,
      group_id = 0,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 3, score = 0, result = "loss"),
      opponent2 = list(id = 0, score = 6, result = "win")
    ),
    list(
      id = 0,
      number = 1,
      stage_id = 0,
      group_id = 0,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 0, score = 6, result = "win"),
      opponent2 = list(id = 2, score = 0, result = "loss")
    ),
    list(
      id = 0,
      number = 1,
      stage_id = 0,
      group_id = 0,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 1, score = 5, result = "win"),
      opponent2 = list(id = 3, score = 0, result = "loss")
    ),
    list(
      id = 0,
      number = 1,
      stage_id = 0,
      group_id = 1,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 7, score = 2, result = "win"),
      opponent2 = list(id = 5, score = 1, result = "loss")
    ),
    list(
      id = 0,
      number = 1,
      stage_id = 0,
      group_id = 1,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 4, score = 4, result = "win"),
      opponent2 = list(id = 6, score = 0, result = "loss")
    ),
    list(
      id = 0,
      number = 2,
      stage_id = 0,
      group_id = 1,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 5, score = 1, result = "draw"),
      opponent2 = list(id = 6, score = 1, result = "draw")
    ),
    list(
      id = 0,
      number = 2,
      stage_id = 0,
      group_id = 1,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 7, score = 1, result = "loss"),
      opponent2 = list(id = 4, score = 3, result = "win")
    ),
    list(
      id = 0,
      number = 3,
      stage_id = 0,
      group_id = 1,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 6, score = 2, result = "win"),
      opponent2 = list(id = 7, score = 1, result = "loss")
    ),
    list(
      id = 0,
      number = 3,
      stage_id = 0,
      group_id = 1,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 4, score = 0, result = "loss"),
      opponent2 = list(id = 5, score = 1, result = "win")
    ),
    list(
      id = 0,
      number = 1,
      stage_id = 0,
      group_id = 2,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 11, score = 1, result = "loss"),
      opponent2 = list(id = 10, score = 2, result = "win")
    ),
    list(
      id = 0,
      number = 1,
      stage_id = 0,
      group_id = 2,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 9, score = 1, result = "loss"),
      opponent2 = list(id = 8, score = 2, result = "win")
    ),
    list(
      id = 0,
      number = 2,
      stage_id = 0,
      group_id = 2,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 10, score = 1, result = "loss"),
      opponent2 = list(id = 8, score = 2, result = "win")
    ),
    list(
      id = 0,
      number = 2,
      stage_id = 0,
      group_id = 2,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 11, score = 0, result = "draw"),
      opponent2 = list(id = 9, score = 0, result = "draw")
    ),
    list(
      id = 0,
      number = 3,
      stage_id = 0,
      group_id = 2,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 9, score = 6, result = "win"),
      opponent2 = list(id = 10, score = 4, result = "loss")
    ),
    list(
      id = 0,
      number = 3,
      stage_id = 0,
      group_id = 2,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 8, score = 2, result = "draw"),
      opponent2 = list(id = 11, score = 2, result = "draw")
    ),
    list(
      id = 0,
      number = 1,
      stage_id = 0,
      group_id = 3,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 13, score = 2, result = "draw"),
      opponent2 = list(id = 14, score = 2, result = "draw")
    ),
    list(
      id = 0,
      number = 1,
      stage_id = 0,
      group_id = 3,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 12, score = 1, result = "win"),
      opponent2 = list(id = 15, score = 0, result = "loss")
    ),
    list(
      id = 0,
      number = 2,
      stage_id = 0,
      group_id = 3,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 15, score = 1, result = "loss"),
      opponent2 = list(id = 14, score = 4, result = "win")
    ),
    list(
      id = 0,
      number = 2,
      stage_id = 0,
      group_id = 3,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 13, score = 0, result = "draw"),
      opponent2 = list(id = 12, score = 0, result = "draw")
    ),
    list(
      id = 0,
      number = 3,
      stage_id = 0,
      group_id = 3,
      round_id = 0,
      child_count = 0,
      status = 4,
      opponent1 = list(id = 14, score = 2, result = "loss"),
      opponent2 = list(id = 12, score = 3, result = "win")
    ),
    list(
      id = 0,
      number = 3,
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