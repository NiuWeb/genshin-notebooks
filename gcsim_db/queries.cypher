// Find the characters with most teams in the Top 1% DPS
MATCH (t:Team)
WITH percentileCont(t.dps, 0.99) AS dps_threshold

MATCH (t:Team)<-[b:IN_TEAM]-(c:Character)
WHERE t.dps >= dps_threshold
WITH c.name AS character_name, b.cons AS constellation, COUNT(t) AS team_count
RETURN character_name, constellation, team_count
ORDER BY team_count DESC, constellation, character_name;

// Find the characters with most teams in the Top 1% DPS -- graph view
MATCH (t:Team)
WITH percentileCont(t.dps, 0.99) AS dps_threshold

MATCH (t:Team)<-[b:IN_TEAM]-(c:Character)
WHERE t.dps >= dps_threshold
RETURN c, b, t;