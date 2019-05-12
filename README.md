# MKS22X-GroupLab
5/06/19
    Caleb Kahan- Wrote the Rock class- Methods Include-
        -Simple Display
        -Complex Display
        -Image Display
        -Random Assignment of the Rock to one of the three displays in the constructor
    Tyler Huang- Ball Display
        -image (pokeball)
        -ellipse shape creation
    Mihad Kho- Living Rock movement
        -random motion in contained window
    Mohammad Jawwad- Ball Movement
        -circular motion
        -elliptical motion (vertical and horizontal)
        -random motion in contained window (initial)

5/07/19
    Caleb Kahan + Brandon Cho (joined today from absence)
        -Rock Changes + Living Rock Changes (1+2+3)
    Tyler Huang (driver) + Mohammad Jawwad (mapper)
        -reviewed and edited bugs
        - changed image to transparency (alpha channel)
        - changed custom complex shape
        - added random color generation
        - began work of bounce
    Mihad was absent

5/08/19
    Tyler Huang + Mohammad Jawwad (mostly Jawwad but Tyler was a nice advice giver)
      - bouncing causes direction change and a random bounce amount, as well as a radius change. However they tend to cluster at the lower right corner.
    Brandon Chao
      - Helped start collideable with Caleb
      - Moved instance variable for pImage to Thing for all classes to inherit
      - Changed data images to be transparent in png files
      
 5/11/19
    Mohammad Jawwad And Caleb Kahan (motions)
        - so jawwad' job is now motions overhaul with Caleb. We will be changing the ball complex motions so bounce doesn't look so janky and clusters at a corner. Ported all repetitive motions of ball (circle/ellipse/vertical ellipse) to living rock, as they do not bounce.
        - humongous bug fix overall and helping each other (jawwad supports ideas / initial attempts, caleb bug fixes and perfects).
        - ball subclass now moves in sine curves in 8 poss directions! WITH BOUNCE
        - currently working on other subclass motion (attempted spiral movement failed, have a basic movement set up. Trying gravity based)
    Tyler Huang and Brandon Cho (display)
        - display changes: created 2 custom ball shapes. (Brandon did the planet like shape!)
