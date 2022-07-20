User.destroy_all
Dog.destroy_all
Skill.destroy_all

user1 = User.create!(username: "brisket_enthusiast", email: "steak@meats.com")

dog1 = Dog.create!(name: "skeeter", age: 2, breed: "cardigan welsch corgi", user_id: user1.id)

# sit = Skill.create!(name: "Sit", level: 1, description: 'Step 1. Get your dogs attention with a treat. 2. While raising your hand upwards, say "sit". 3. Your dog should sit and look at you. 4. Reward your dog with the treat.', criteria: "Your dog should sit right as you are saying the command, and stay sitting until you release them", youtube_link: "https://www.youtube.com/watch?v=EDgi2sLlWAU")
# down = Skill.create!(name: "Down", level: 2, description: 'Step 1. Get your dogs attention with a treat. 2. While lowering your hand to the floor and moving it towards you, say "down". 3. Your dog should lay down look at you. 4. Reward your dog with the treat.', criteria: "Your dog should lay down right as you are saying the command, and stay laying until you release them", youtube_link: "https://www.youtube.com/watch?v=vkHs_rKdloc")
# shake = Skill.create!(name: "Shake", level: 3, description: "Step 1. Get your dogs attention with a treat. 2. Have your dog sit. 3. Extend your empty hand towards one of your dogs paws, move the treat towards your dogs ear opposite the paw to shake, all while saying shake. 4. Shake hands wih your dog", criteria: "Your dog should be able to shake with just the verbal cue.", youtube_link: "https://www.youtube.com/watch?v=CRoDTUkzVpU)")

stay = Skill.create!(name: 'Stay', level: 2,
                     description: 'Step 1. Have your dog sit. Step 2. Hold your hand out to your dog with your palm out and facing away from you (think telling someone to stop), and say Stay. Step 3. Take a few steps back from your dog, they must stay sitting while you do this.  When ready to end the command, use your release work or call your dog to you. Step 4. Reward with a treat', criteria: 'Ideally, your dog should be able to say for any amount of time you determine, preferably with you out of site from them.', youtube_link: 'GAziMECDxD0')

off = Skill.create!(name: 'Off', level: 2,
                    description: "Step 1. Dogs jump to greet people, and they keep doing it because it works to get them attention. First we want to make sure your dog is on a leash, so that we can better manage them. When your dog wants to jump on someone, step on their leash (making sure that they have enough leash to sit upright comfortably and we aren't hurting them), and saying the word 'off'. Step 2. Once your dog is sitting and no longer trying to jump, reward your dog with attention and/or a high value treat or toy. Step 3. Continue to reinforce the alternative sitting action with treats/toys/attention after saying the 'off' command.", criteria: 'Your dog should be able to obey the off command every time she/he wants to jump or otherwise greet someone or another dog even when at a level of high excitement/distraction.', youtube_link: 'dJsKtHDtpSQ')

come = Skill.create!(name: 'Come', level: 1,
                     description: "Step 1. Get your dog's attention with a treat or a favorite toy. Step 2. Walk away a few steps and then call your dog's name in a friendly, exciting tone. Getting down low can also sometimes help. Step 3. As your dog comes to you, gently hold their collar and either feed them the treat or let them play with the toy. Step 4. Gradually increase the distance that you are from your dog, until eventually you can call your dog in from another room or from outside. Step 5. Once your dog has learned to come in a controlled environment, taking the training to a safe outdoor space with a longer training leash can introduce new challenges with the added distractions and excitement of an outdoor environment.", criteria: 'Your dog should be able to come whenever called, even when facing distractions or if excited.', youtube_link: 'rwldfBjFsdE')

bed = Skill.create!(name: 'Bed', level: 2,
                    description: 'Step 1. Get your dogs attention with a treat. Step 2. Point to the bed and get your dog to climb on the bed. Step 3. Have your dog lay down. Reward them with a treat. ', criteria: 'Your dog should go to the place that you designated as their bed on command.', youtube_link: 'GIyJ8BHrTPI')

take_it = Skill.create!(name: 'Take It', level: 2,
                        description: "Step 1. Get your dogs attention with some treats or dog food. Step 2. Tell your dog the command 'wait'. They should not be going for the food in your hand. Step 3. Use the command 'Take It' and your dog should take the treat or food.", criteria: 'Your dog should take the treat from your hand on command.', youtube_link: 'grdlSRkbi1c')

drop_it = Skill.create!(name: 'Drop It', level: 1,
                        description: "Step 1. Hold a treat or high-value toy in your hand. Step 2. While your dog has a toy or treat in their mouth, give the command 'Drop It'. Step 3. Your dog should drop the toy and look to you for a release word or command. Step 4. Reward your dog with the treat or toy.", criteria: 'Your dog should be able to drop any object that they have in their mouth and look to you for your release word.', youtube_link: 'stdnfuFbmUc')

quiet = Skill.create!(name: 'Quiet', level: 1,
                      description: "Step 1. Be ready during a situation in which your dog is likely to bark. Step 2. When your dog barks, briefly acknowledge it by checking for the source (look out the window or door). Then, go back to yourc dog and get its attention (you might try holding up the treat or toy). Step 3. After the barking stops, give your dog the toy or treat. Step 4. Repeat these steps and gradually wait for slightly longer periods of silence each time before giving the treat. Step 5. Once your dog has remained quiet a few times, add the cue word you have chosen. While your dog is barking, say your quiet command in a firm, audible, and upbeat voice while holding up the reward. Give your dog the reward when the barking stops. Step 6. ractice the 'quiet' cue frequently. You can do this anytime your dog barks, but keep training sessions brief.",  criteria: "When your dog succesfully stops barking after the command is given its considered a pass.", youtube_link: 'fcVPfkbYIM')

shake = Skill.create!(name: "Shake", level: 2, 
                      description: "Step 1. Get your dogs attention with a treat. Step 2. Have your dog sit. Step 3. Extend your empty hand towards one of your dogs paws, move the treat towards your dogs ear opposite the paw to shake, all while saying shake. Step 4. Shake hands wih your dog", criteria: "Your dog should be able to shake with just the verbal cue.", youtube_link: "G3-hec29wII")

wait = Skill.create!(name: "Wait", level: 1, 
                      description: "Step 1. Place your dogs dog food down in their bowl. Do not allow them to start eating. Step 2. Have your dog sit, and make eye contact with you while saying Wait. Step 3. Have your dog hold this position until you are ready for them to eat. Step 4. Say your release word to allow your dog to start eating.", criteria: "Your dog should be able to hold in the wait position for as long as you deem fit. When setting the dogs food down, they should know to enter the Wait command before eating.", youtube_link: "c--37qrAG2A")

leash = Skill.create!(name: "Leash", level: 3, 
                      description: "Step 1. Fill your pocket or treat pouch with treats Step 2. Decide what side you'd like the dog to walk on, and hold a few treats on that side of your body. Step 3. Hold your leash in the hand opposite the dog. Step 4. Take a step, then stop. Step 5. Repeat", criteria: "Ideally your dog should know what side they should walk on. Your dog should not be pulling on leash and should be receptive to your commands.", youtube_link: "v1ftuJIJjTw")

speak = Skill.create!(name: "Speak", level: 3, description: "Step 1. Fill your pocket or treat pouch with treats. Step 2. Wait for them to bark. Step 3. Reward your dog with the treat. Step 4. Introduce the command word. Step 5. Repeat", criteria: "Ideally your dog should speak/bark on command.", youtube_link: "w0TASn4OhZc")

sit = Skill.create!(name: "Sit", level: 1, description: "Step 1. Get your dog's attention with a treat. Step 2. While raising your hand upwards, say 'Sit'. Step 3. Your dog should sit with its hind legs pressed against the ground and look at you. Step 4. Reward your dog with the treat.", criteria: "Your dog should sit right as you are saying the command, and stay sitting until you release them.", youtube_link: "5-MA-rGbt9k")

down = Skill.create!(name: "Down", level: 1, description: "Step 1. Get your dog's attention with a treat. Step 2. While lowering your hand to the floor and moving it in front of your dog's eyes, say 'Down'. Step 3. Your dog should lay down on its belly with its front legs out stretched and look at you.  Step 4. Reward your dog with the treat.", criteria: "Your dog should lay down after you say the command and say there until you release them.", youtube_link: "XWyfAHk-9M4")





















#end