story = Story.find_by(title: "Test Autobiography")
if story.nil?
  puts "Story not found"
  exit
end

puts "Story: #{story.title}"
puts "Profile: #{story.story_profile.full_name}"
puts "Total chapters: #{story.chapters.count}"

chapters = story.chapters.order(:sort_order)

chapters.each do |chapter|
  puts "\nProcessing chapter: #{chapter.title}"

  sections_data = case chapter.title
  when "Family Heritage & Origins"
    [
      { title: "Ancestral Roots", content: "My family traces its roots back to County Cork, Ireland. My great-grandparents left during the potato famine in the 1840s, carrying little more than hope and determination. They settled in Philadelphia, where they built a new life from scratch." },
      { title: "My Parents Story", content: "My father was a steelworker, strong and principled. My mother was a schoolteacher who believed education could change the world. Together, they created a home filled with love, discipline, and the belief that we could achieve anything through hard work." },
      { title: "The Old Neighborhood", content: "I grew up in a working-class neighborhood where everyone knew each other. Front porches were gathering places, and neighbors looked out for one another. It was a community bound by shared struggles and mutual support." }
    ]
  when "Child Years"
    [
      { title: "Earliest Memories", content: "My earliest memory is of my grandmother baking bread in her kitchen. The smell of fresh bread still takes me back to those warm afternoons, sitting at her table, listening to her stories of the old country." },
      { title: "Elementary School Adventures", content: "School was my sanctuary. I loved learning, especially reading. Mrs. Patterson, my third-grade teacher, noticed my love for books and would lend me novels from her personal collection. She opened up whole new worlds for me." },
      { title: "Childhood Friends", content: "My best friend was Sarah from next door. We were inseparable from age six onwards. We built forts, put on plays for our parents, and dreamed about what we would be when we grew up. She remains my closest friend to this day." }
    ]
  when "School Years"
    [
      { title: "Junior High Challenges", content: "Junior high was tough. I struggled to fit in and dealt with bullying. But I found refuge in the school library and the drama club, where I discovered my voice and learned to stand up for myself." },
      { title: "High School Transformation", content: "High school changed everything. I joined the student newspaper, became editor my senior year, and found my passion for writing and journalism. I also met my first serious boyfriend, Tom, who taught me about heartbreak and resilience." },
      { title: "College Preparation", content: "Senior year was intense. I applied to ten colleges, worked part-time at the local bookstore, and maintained straight As. When I got accepted to my dream school with a scholarship, my parents cried tears of joy." }
    ]
  when "College Years / Early Adulthood"
    [
      { title: "Freshman Year", content: "College was overwhelming at first. I was the first in my family to attend university. Everything was new and intimidating, but I was determined to succeed. I studied journalism and threw myself into campus life." },
      { title: "Finding My Voice", content: "By sophomore year, I was writing for the college newspaper and interning at the local NPR station. I covered student protests, interviewed professors, and learned the power of storytelling to create change." },
      { title: "Study Abroad", content: "Junior year, I spent a semester in London. Living abroad expanded my worldview and taught me independence. I traveled across Europe, met people from dozens of countries, and returned home transformed." }
    ]
  when "Military Service"
    [
      { title: "The Decision to Serve", content: "After college, I joined the Air Force. It wasnt an easy decision, but I felt called to serve. My parents were worried, but they understood my need to contribute something bigger than myself." },
      { title: "Basic Training", content: "Basic training at Lackland Air Force Base was the hardest thing Id ever done. The physical challenges were intense, but the mental toughness required was even greater. I learned discipline, teamwork, and what I was truly capable of." },
      { title: "Service and Sacrifice", content: "I served for four years, including a deployment to the Middle East. The experience gave me perspective, lifelong friendships, and a deep appreciation for freedom. It also showed me the true cost of war." }
    ]
  when "First Romance / Marriage"
    [
      { title: "Meeting My Soulmate", content: "I met David at a friends barbecue in 1998. He was funny, kind, and shared my love of books and travel. We talked for hours that first night, and I knew hed be important in my life." },
      { title: "Building Our Relationship", content: "We dated for three years, learning each others quirks and dreams. David supported my career ambitions and challenged me to be my best self. We traveled together, cooked together, and built a foundation of friendship and love." },
      { title: "Our Wedding Day", content: "We married in 2001 in a small ceremony surrounded by family and close friends. It rained that day, but we didnt care. Dancing in the rain became a metaphor for our marriage - finding joy even in unexpected moments." }
    ]
  when "Career Years"
    [
      { title: "Starting Out", content: "My first job was as a junior reporter at a small-town newspaper. The pay was terrible, but I learned everything - from writing obituaries to covering city council meetings. Every story taught me something new about people and communities." },
      { title: "Career Breakthrough", content: "After five years, I landed a position at a major metropolitan newspaper. I covered education policy, wrote investigative pieces, and won my first journalism award. The work was demanding but deeply fulfilling." },
      { title: "Leadership and Mentorship", content: "Eventually, I became an editor, leading a team of talented young journalists. Mentoring the next generation became as rewarding as my own reporting had been. I loved helping them find their voices and tell important stories." }
    ]
  when "Raising Family"
    [
      { title: "Becoming a Mother", content: "Our daughter Lily was born in 2003, followed by our son James in 2006. Parenthood was harder than I imagined but more rewarding than I could have dreamed. Every milestone, every laugh, every challenge brought new meaning to my life." },
      { title: "Balancing Work and Family", content: "Juggling a demanding career and motherhood required constant negotiation. David and I became a true partnership, sharing responsibilities and supporting each others dreams. We werent perfect, but we were committed." },
      { title: "Family Adventures", content: "We made it a priority to travel as a family, even on a budget. Road trips, camping adventures, and eventually international travel taught our kids about the world and created memories that bind us together." }
    ]
  when "Middle Age"
    [
      { title: "Life Transitions", content: "My fifties brought unexpected changes. My father passed away, my kids left for college, and I transitioned to freelance writing. These losses and changes forced me to redefine who I was beyond my roles as daughter, mother, and employee." },
      { title: "New Passions", content: "I discovered pottery, joined a book club, and started volunteering at a literacy nonprofit. These new pursuits brought fresh energy and purpose. I realized that reinvention is possible at any age." },
      { title: "Deepening Relationships", content: "With more time, David and I rediscovered each other. We took dance lessons, went on date nights, and talked about our dreams for the next chapter. Our marriage deepened in ways I hadnt anticipated." }
    ]
  when "Retirement"
    [
      { title: "Leaving the Workforce", content: "I retired at 65, ready for a new adventure. The transition was bittersweet - I missed the daily purpose of work but was excited about the freedom ahead. I threw myself a retirement party and invited everyone whod been part of my journey." },
      { title: "Reinventing Retirement", content: "Retirement isnt about stopping - its about choosing what matters most. I write a blog, volunteer teaching writing to seniors, and finally have time to read all the books on my list. Every day is mine to design." },
      { title: "Travel Dreams Fulfilled", content: "David and I are checking off our travel bucket list - Japan, New Zealand, Iceland. We travel slowly now, staying in places long enough to really know them. These adventures are the reward for decades of hard work." }
    ]
  when "Golden Years"
    [
      { title: "Grandparenthood", content: "Becoming a grandmother to Lilys twins was pure joy. Watching my daughter become a mother, seeing my grandchildren grow, and being able to spoil them without the daily responsibility - its a special kind of love." },
      { title: "Staying Active", content: "I walk every morning, do yoga twice a week, and keep my mind sharp with puzzles and learning. I recently started learning Spanish - why not? Age is just a number, and Im determined to stay engaged with life." },
      { title: "Gratitude and Reflection", content: "Looking back, Im filled with gratitude. For my family, my career, my health, and the opportunities Ive had. Not everything was easy, but it was all worth it. I wake up each day thankful for another chance to live fully." }
    ]
  when "Life Wisdom & Philosophy"
    [
      { title: "Lessons Learned", content: "Life taught me that resilience matters more than perfection. That kindness costs nothing but means everything. That change is inevitable and growth is optional. That love - in all its forms - is what makes life worth living." },
      { title: "Advice to My Children", content: "I tell my kids: Take risks. Travel. Read widely. Listen more than you speak. Dont wait for perfect timing. Forgive quickly. Love deeply. Remember that your career is what you do, but your relationships are who you are." },
      { title: "My Legacy", content: "I hope to be remembered as someone who cared - about truth, about justice, about people. Someone who showed up, worked hard, and tried to leave things better than I found them. Someone who loved well and lived fully." }
    ]
  else
    []
  end

  if sections_data.empty?
    puts "  No sections defined for this chapter"
    next
  end

  sections_data.each_with_index do |section_data, index|
    section = chapter.story_sections.create!(
      title: section_data[:title],
      sort_order: index + 1
    )
    section.update(content: section_data[:content])
    puts "  ✓ Created section: #{section.title}"
  end
end

puts "\n" + "="*60
puts "✅ COMPLETED!"
puts "="*60
puts "Story: #{story.title}"
puts "Total chapters: #{story.chapters.count}"
puts "Total sections: #{story.story_sections.count}"
puts "\nAll chapters now have rich, detailed content!"
