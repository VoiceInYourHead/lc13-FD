#define STRENGTH_STAT "Strength"
#define WILLPOWER_STAT "Willpower"
#define OBSERVATION_STAT "Observation"
#define REFLEXES_STAT "Reflexes"
#define LUCK_STAT "Luck"
#define PRECISION_STAT "Precision"
#define INTELLECT_STAT "Intellect"

#define WORK_TO_ATTRIBUTE list(\
							ABNORMALITY_WORK_INSTINCT = STRENGTH_STAT,\
							ABNORMALITY_WORK_INSIGHT = WILLPOWER_STAT,\
							ABNORMALITY_WORK_ATTACHMENT = OBSERVATION_STAT,\
							ABNORMALITY_WORK_REPRESSION = REFLEXES_STAT,\
							)


/// The max human health is adjusted to default define + fortitude points * this modifier
#define STRENGTH_MOD 1

/// Same as above, but for sanity and prudence
#define WILLPOWER_MOD 1

/// What the temperance scaling modifier is. Roughly, this is the temperance at infinite temperance. Higher is better.
#define OBSERVATION_SUCCESS_MOD 40

/// The justice attribute is divided by this number to decide the movement speed buff; The higher it is - the lower is maximum speed
#define REFLEXES_MOVESPEED_DIVISER 230
