# ASM_Hacks
Miscellaneous ASM Hacks/Patches I decided to do when I felt like procrastinating real work

## FE8 Perfect Luck
Basic Idea is to rig the game in your favor, with a few exceptions. 
### Perfect Luck (Hit/Crit)
The main UPS patch (as of 11/11/23) serves to rig both your and the enemy's hit & crit rates in your favor.
In effect, it rounds your hit/crit UP to the nearest hundred, and the enemy's DOWN to the nearest hundred. It does this by setting **YOUR** hit/crit to 100 if there's a chance it occurs at all (**probability is > 0**) and setting the **ENEMY's** hit/crit to 0 if there's a chance it won't occur (**probability is < 100**).
### AlwaysPierce
Also included is a slightly related "AlwaysPierce" txt installer that's meant to be separate from the main "Perfect Luck" patch since it functions somewhat differently. AlwaysPierce basically just ensures that **ANY** Wyvern Knight will always proc Pierce. While it technically procs for enemies as well, there's only 1 enemy Wyvern Knight in the base game (Valter) so otherwise it always works in your favor. This works by simply setting the proc rate to 100 instead of using the user's level.

## Credit
- Credit to [Scraiza](https://www.youtube.com/channel/UCIcHbDiy0_2peLq5SsGx06A) for their FE7 Perfect Luck patch, which I used as a starting point for my FE8 Hit/Crit version
- Credit to [Tequila](https://feuniverse.us/u/Tequila) on FEUniverse for creating an amazing in-depth [guide](https://feuniverse.us/t/gbafe-assembly-for-dummies-by-dummies/3563) that taught me how to use the debugger and the basics of Thumb Assembly


## TODO 
- Add short guide to installing ASM/text with Event Assembler and UPS patches with NUPS
- Create more rigged skill procs like greatshield/silencer and find a way to only do it for player-controlled units (most important for greatshield)
