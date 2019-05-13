# MKS22X-GroupLab
**5/06/19**<br/><br/>
    **Caleb Kahan- Wrote the Rock class**- Methods Include-<br/>
        -Simple Display<br/>
        -Complex Display<br/>
        -Image Display<br/>
        -Random Assignment of the Rock to one of the three displays in the constructor<br/>
    **Tyler Huang- Ball Display**<br/>
        -image (pokeball)<br/>
        -ellipse shape creation<br/>
    **Mihad Kho- Living Rock movement**<br/>
        -random motion in contained window<br/>
    **Mohammad Jawwad- Ball Movement**<br/>
        -circular motion<br/>
        -elliptical motion (vertical and horizontal)<br/>
        -random motion in contained window (initial)<br/><br/>

**5/07/19**<br/><br/>
    **Caleb Kahan + Brandon Chao (joined today from absence)**<br/>
        -Rock Changes + Living Rock Changes (1+2+3)<br/>
    **Tyler Huang (driver) + Mohammad Jawwad (mapper)**<br/>
        -reviewed and edited bugs<br/>
        - changed image to transparency (alpha channel)<br/>
        - changed custom complex shape<br/>
        - added random color generation<br/>
        - began work of bounce<br/>
    **Mihad was absent**<br/><br/>

**5/08/19**<br/><br/>
    **Tyler Huang and Mohammad Jawwad** (mostly Jawwad but Tyler was a nice advice giver)<br/>
      - bouncing causes direction change and a random bounce amount, as well as a radius change. However they tend to cluster at the lower right corner.<br/>
    **Brandon Chao and Caleb Kahan**<br/>
      - Helped start collideable with Caleb<br/>
      - Moved instance variable for pImage to Thing for all classes to inherit<br/>
      - Changed data images to be transparent in png files<br/><br/>
      
**5/11/19**<br/><br/>
    **Mohammad Jawwad And Caleb Kahan (motions)**<br/>
        - so jawwad' job is now motions overhaul with Caleb. We will be changing the ball complex motions so bounce doesn't look so 
        janky and clusters at a corner. Ported all repetitive motions of ball (circle/ellipse/vertical ellipse) to living rock, as they 
        do not bounce.<br/>
        - humongous bug fix overall and helping each other (jawwad supports ideas / initial attempts, caleb bug fixes and perfects).
        - ball subclass now moves in sine curves in 8 poss directions! WITH BOUNCE<br/>
        - currently working on other subclass motion (attempted spiral movement failed, have a basic movement set up. Trying gravity
        based, though this clusters or eventually disappears off window)<br/>
        - Caleb wrote a meh collideable. There is a huge overhaul of bug fixes we will be doing tomorrow on this.<br/>
    **Brandon Cho (display)**<br/>
        - display changes: created custom ball shape. (Brandon did the planet like shape! such wow!<br/><br/>
        
**5/12/19**<br /><br />
   **Mohammad Jawwad** <br />
      -bug changes/anything that doesn't comply with the group had to be reported to other members/ individually fixed.<br />
      -explanations of collision/ figuring out how to show color change of custom balls.<br />
      -helping with fixing collison<br />
      -removed useless portions/files<br />
      -final polishing <br />
   **Mihad Kho** <br /> 
      -custom ball shape other subclass based off infinity gauntlet.<br />
      -image change assignments from jawwad<br />
   **Tyler Huang / Brandon Chao** <br />
      -bug assignments from Jawwad<br />
      -image change assignments<br />
      -Brandon specifically: figured out why two images were shown for collision instead of 1 <br />
      -Brandon specifically: ball collision changes <br />
   **Caleb Kahan** <br />
      -also finding and reporting bugs to group<br />
      -figured out how to avoid the clusters/ball escapes of gravitational based motion (speed limits). Gravity bouncing stuff in         general<br />
      * *ALL MOTIONS ARE COMPLETE NOW!* * <br />
      -living rocks affect other living rocks and rocks. (a living rock and a rock are both collideable and both things... so they both would affect each other if touching. Same goes for two rocks that are too close to each other!)<br />
      -Fixed Distance Formula- to d= difference in x squared + difference in y squared<br />
      -new image for exploding rock <br />
      -final polishing with Jawwad <br />
      
      
   


<br/><br/><br/>* *side note: Jawwad's been updating the README. Please send him hot cocoa for his efforts.* *<br />
Tea warning talk to Jawwad
