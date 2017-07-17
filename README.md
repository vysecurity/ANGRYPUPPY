# ANGRYPUPPY
------------

Bloodhound Attack Path Execution for Cobalt Strike

Authors: 
--------
Calvin Hedler (@001SPARTaN) and Vincent Yiu (@vysecurity)

Special Thanks:
---------------
* armitagehacker: Raphael Mudge for the COBALTSTRIKE framework
* wald0: Andy Robbins: Large amounts of assistance with Cypher queries

Beta Testers:
-------------
* bspence7337
* rasta_mouse
* st3r30byt3
* merrillmatt011
* plissken
* benheise
* nuttsmare

And more! We had initially attempted to keep track but now there's way too many of you :)

Change Log:
-----------
* [11/07/2017]: Initial push
* [13/07/2017]: Finished Automated Attack Logic
* [14/07/2017]: Revamp to polling mode attack logic
* [15/07/2017]: Revamp code
* [16/07/2017]: Added import JSON and aliasing

Getting Started:
-----------
ANGRYPUPPY is a tool for BloodHound attack path execution in Cobalt Strike.

Before you use ANGRYPUPPY, you will require several things:
- Cobalt Strike -- https://cobaltstrike.com
- BloodHound -- https://github.com/BloodHoundAD/BloodHound
- The org.json library -- https://mvnrepository.com/artifact/org.json/json

Once you have obtained these, clone the ANGRYPUPPY repository. Due to limitations in Aggressor's Java import, you need to make one change to the ANGRYPUPPY.cna file:

`import org.json.* from: /path/to/org.json.jar;`

Once you have made this change, you're ready to get started.

ANGRYPUPPY assumes that you will have a foothold on the target network. Once you have a foothold on the target network, run BloodHound collection, and import the data into BloodHound. After that, you must identify the attack path that you wish to use, for which purpose we've included the `cypher` beacon alias. Typing `cypher` will generate Cypher queries for all the users and computers that you have access to in Cobalt Strike, and post them to the **event log**. If any of these users or computers have a valid attack path to Domain Admin, these Cypher queries will return the best path. Paste the appropriate Cypher query into BloodHound's "raw query" field, and you will see the attack path displayed.

With a valid attack path displayed in BloodHound, you must export this to a json file, so that ANGRYPUPPY can import it. This file can go anywhere, and ANGRYPUPPY will prompt you for it when you run the command.

After that, simply run the `angrypuppy` beacon alias in any of your active sessions. ANGRYPUPPY will parse the BloodHound attack path, and automatically execute, based on the nodes in the attack path. For every User node, ANGRYPUPPY will run Mimikatz on the last Computer node, and for every Computer node, ANGRYPUPPY will use the last User node's credentials and psexec to the next Computer node. We're planning on adding additional functionality to change how ANGRYPUPPY performs lateral movement, to allow for other movement options.

Video:
------
ANGRYPUPPY - Development:
https://youtu.be/smKYfi8vBCQ

To-do:
------

- Access Control List attack path automation with automated fixing
- Rework to use BloodHound REST API, automate end-to-end
- Add ability to select lateral movement method
- Need beta testers

