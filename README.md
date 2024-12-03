# XP Grinder (Kill Counter)
A lightweight add-on that allows you to enter the average experience you get per mob. The addon then calculates how much kills you need until you reach the next level.

**To set the average experience:**
`/kc set xp <amount>`

**To show the frame with the amount of kills you need:**
`/kc remaining`

If you set the wrong value of the average experience, you can simply use the command again to correct it.

When you don't see the kills counting down it is because you probably received less experience from a kill than you have set initially. It should go down when the experience you set is the same or more.

Be aware to set the right amount again when you join a party.

**Plans on moving forward:**
1. An option to hide the frame (it will only be hidden when `/reload` again).
2. A reset button to reset the count.
3. See if it's possible to gather the experience based on the kill itself instead of having to manually set it.
