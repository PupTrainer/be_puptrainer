User.destroy_all
Dog.destroy_all
Skill.destroy_all

user1 = User.create!(username: 'brisket_enthusiast', email: 'steak@meats.com')

dog1 = Dog.create!(name: 'skeeter', age: 2, breed: 'cardigan welsch corgi', user_id: user1.id)

sit = Skill.create!(name: 'Sit', level: 1, description: 'Step 1. Get your dogs attention with a treat. 2. While raising your hand upwards, say "sit". 3. Your dog should sit and look at you. 4. Reward your dog with the treat.', criteria: 'Your dog should sit right as you are saying the command, and stay sitting until you release them', youtube_link: 'https://www.youtube.com/watch?v=EDgi2sLlWAU')
down = Skill.create!(name: 'Down', level: 2, description: 'Step 1. Get your dogs attention with a treat. 2. While lowering your hand to the floor and moving it towards you, say "down". 3. Your dog should lay down look at you. 4. Reward your dog with the treat.', criteria: 'Your dog should lay down right as you are saying the command, and stay laying until you release them', youtube_link: 'https://www.youtube.com/watch?v=vkHs_rKdloc')
down = Skill.create!(name: 'Shake', level: 3, description: 'Step 1. Get your dogs attention with a treat. 2. Have your dog sit. 3. Extend your empty hand towards one of your dogs paws, move the treat towards your dogs ear opposite the paw to shake, all while saying shake. 4. Shake hands wih your dog', criteria: 'Your dog should be able to shake with just the verbal cue.', youtube_link: 'https://www.youtube.com/watch?v=CRoDTUkzVpU)