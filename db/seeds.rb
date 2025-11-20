# Clear existing data (only in development)
if Rails.env.development?
  EventTemplate.destroy_all
  LifePhase.destroy_all
end

# Create Life Phases
life_phases = [
  {
    name: "Family Heritage & Origins",
    slug: "family-heritage",
    description: "Your family background, parents, and hometown",
    sort_order: 1,
    icon: "🏠",
    templates: [
      { title: "Family Origins", prompt: "Where did your family come from? What countries or regions did your ancestors emigrate from?" },
      { title: "About Your Parents", prompt: "Tell us about your mother and father. What were they like? What did they do for a living?" },
      { title: "Your Hometown", prompt: "Describe the place where you grew up. What was the town or city like? What do you remember most about it?" },
      { title: "Family Traditions", prompt: "What traditions or customs did your family have? Were there special celebrations or rituals?" },
      { title: "Extended Family", prompt: "Tell us about your grandparents, aunts, uncles, and other relatives who influenced you." }
    ]
  },
  {
    name: "Child Years",
    slug: "child-years",
    description: "Your early childhood memories (ages 0-12)",
    sort_order: 2,
    icon: "👶",
    templates: [
      { title: "Earliest Memory", prompt: "What is your earliest childhood memory? How old were you?" },
      { title: "Your Childhood Home", prompt: "Describe the house or apartment you lived in as a child. What was your favorite room?" },
      { title: "Siblings", prompt: "Tell us about your brothers and sisters. What were your relationships like?" },
      { title: "Childhood Friends", prompt: "Who were your best friends growing up? What did you do together?" },
      { title: "Favorite Activities", prompt: "What were your favorite games, toys, or activities as a child?" }
    ]
  },
  {
    name: "School Years",
    slug: "school-years",
    description: "Your teenage years and high school experience (ages 13-18)",
    sort_order: 3,
    icon: "📚",
    templates: [
      { title: "School Experience", prompt: "What was school like for you? Were you a good student?" },
      { title: "Favorite Subjects", prompt: "What subjects did you enjoy most? Were there any you struggled with?" },
      { title: "Memorable Teachers", prompt: "Which teachers made an impact on you? How did they influence you?" },
      { title: "School Friends", prompt: "Who were your closest friends in school? Are you still in touch?" },
      { title: "Extracurricular Activities", prompt: "Did you participate in sports, clubs, or other activities? Tell us about them." }
    ]
  },
  {
    name: "College Years / Early Adulthood",
    slug: "college-years",
    description: "Your college experience or early adult years (ages 19-25)",
    sort_order: 4,
    icon: "🎓",
    templates: [
      { title: "College Decision", prompt: "Did you go to college? How did you decide where to go or what to study?" },
      { title: "College Life", prompt: "What was college life like? Where did you live? Who were your friends?" },
      { title: "Major Studies", prompt: "What did you study? How did you choose your major?" },
      { title: "Growth & Discovery", prompt: "How did you change or grow during these years? What did you discover about yourself?" },
      { title: "First Job or Career Start", prompt: "What was your first real job? How did you get it?" }
    ]
  },
  {
    name: "First Romance / Marriage",
    slug: "romance-marriage",
    description: "Your romantic relationships and marriage",
    sort_order: 5,
    icon: "❤️",
    templates: [
      { title: "First Love", prompt: "Who was your first love? What do you remember about that relationship?" },
      { title: "Meeting Your Spouse", prompt: "How did you meet your spouse or partner? What attracted you to them?" },
      { title: "Courtship", prompt: "Tell us about your courtship. What did you do together?" },
      { title: "The Proposal", prompt: "How did the proposal happen? Who proposed and how?" },
      { title: "Wedding Day", prompt: "Describe your wedding day. What are your most vivid memories?" }
    ]
  },
  {
    name: "Career Years",
    slug: "career-years",
    description: "Your professional life and career development",
    sort_order: 6,
    icon: "💼",
    templates: [
      { title: "Career Path", prompt: "What career did you pursue? How did you get started in this field?" },
      { title: "Career Highlights", prompt: "What were the high points of your career? What accomplishments are you most proud of?" },
      { title: "Challenges", prompt: "What challenges did you face in your career? How did you overcome them?" },
      { title: "Mentors & Colleagues", prompt: "Who were the people who helped or influenced your career?" },
      { title: "Work-Life Balance", prompt: "How did you balance work with family and personal life?" }
    ]
  },
  {
    name: "Raising Family",
    slug: "raising-family",
    description: "Your experience as a parent raising children",
    sort_order: 7,
    icon: "👨‍👩‍👧‍👦",
    templates: [
      { title: "Becoming a Parent", prompt: "What was it like to become a parent for the first time?" },
      { title: "Your Children", prompt: "Tell us about each of your children. What were they like growing up?" },
      { title: "Parenting Philosophy", prompt: "What was your approach to parenting? What values did you try to instill?" },
      { title: "Family Life", prompt: "What was daily family life like? What traditions did you create?" },
      { title: "Proud Moments", prompt: "What moments as a parent made you most proud?" }
    ]
  },
  {
    name: "Middle Age",
    slug: "middle-age",
    description: "Your middle years and life transitions",
    sort_order: 8,
    icon: "🌟",
    templates: [
      { title: "Life Changes", prompt: "What major changes or transitions happened during your middle years?" },
      { title: "New Interests", prompt: "Did you develop new interests or hobbies during this time?" },
      { title: "Community Involvement", prompt: "Did you get involved in your community? How?" },
      { title: "Reflections", prompt: "What did you learn about yourself during these years?" }
    ]
  },
  {
    name: "Retirement",
    slug: "retirement",
    description: "Your retirement years and new chapters",
    sort_order: 9,
    icon: "🌅",
    templates: [
      { title: "Retirement Decision", prompt: "When and why did you decide to retire? How did it feel?" },
      { title: "New Routine", prompt: "What is life like in retirement? How do you spend your days?" },
      { title: "Travel & Adventure", prompt: "Have you traveled or pursued new adventures? Tell us about them." },
      { title: "Time with Family", prompt: "How has retirement changed your relationships with family?" }
    ]
  },
  {
    name: "Golden Years",
    slug: "golden-years",
    description: "Your current life and reflections",
    sort_order: 10,
    icon: "✨",
    templates: [
      { title: "Current Life", prompt: "What does a typical day look like for you now?" },
      { title: "Grandchildren", prompt: "Tell us about your grandchildren. What do you love about being a grandparent?" },
      { title: "Staying Active", prompt: "How do you stay active and engaged?" },
      { title: "Gratitude", prompt: "What are you most grateful for in this stage of life?" }
    ]
  },
  {
    name: "Life Wisdom & Philosophy",
    slug: "life-wisdom",
    description: "Your reflections, wisdom, and legacy",
    sort_order: 11,
    icon: "💭",
    templates: [
      { title: "People Who Influenced You", prompt: "Who influenced you most in life? How did they shape who you became?" },
      { title: "Life's Mission", prompt: "Looking back, what do you see as your life's mission or purpose?" },
      { title: "Philosophy on Life", prompt: "What is your philosophy on life, success, and happiness?" },
      { title: "Advice to Children", prompt: "What advice would you give to your children and grandchildren?" },
      { title: "Greatest Lessons", prompt: "What are the greatest lessons you've learned in life?" },
      { title: "Your Legacy", prompt: "What do you want to be remembered for?" }
    ]
  }
]

# Create life phases and their templates
life_phases.each do |phase_data|
  templates = phase_data.delete(:templates)

  phase = LifePhase.create!(phase_data)

  sort_order = 1
  templates.each do |template_data|
    phase.event_templates.create!(
      title: template_data[:title],
      prompt: template_data[:prompt],
      sort_order: sort_order
    )
    sort_order += 1
  end

  puts "Created LifePhase: #{phase.name} with #{templates.count} templates"
end

puts "\n✅ Seed data created successfully!"
puts "Total LifePhases: #{LifePhase.count}"
puts "Total EventTemplates: #{EventTemplate.count}"

# Create default account and user for testing
puts "\n📝 Creating default test user..."
account = Account.find_or_create_by!(name: "MyLife") do |a|
  a.account_type = "individual"
end

user = User.find_or_initialize_by(email_address: "mskimsid@gmail.com") do |u|
  u.account = account
  u.name = "MyLife User"
  u.password = "it-is-mylife"
  u.password_confirmation = "it-is-mylife"
end

if user.new_record?
  user.save!
  puts "✅ Created default user"
else
  puts "ℹ️  User already exists"
end

puts "\n🎉 All seeds complete!"
puts "📧 Login Email: mskimsid@gmail.com"
puts "🔑 Password: it-is-mylife"
