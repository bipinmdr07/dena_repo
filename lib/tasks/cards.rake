task :create_forums => :environment do
  Card.create(user_id: 1, question: "Fix the code below:\n <pre><code class='ruby'>if 1 = 2\n  puts 'Hi'\nelse\n  puts 'bye'\nend</code></pre>", 
    answer: "<pre><code class='ruby'>if 1 == 2\n  puts 'Hi'\nelse\n  puts 'bye'\nend</code></pre>")

  card.update(user_id: 1, question: "Fix the code below\n <pre><code class='ruby'>if 1 = 2\n  puts 'Hi'\nelse\n  puts 'bye'\nend</code></pre>", 
    answer: "<pre><code class='ruby'>if 1 == 2\n  puts 'Hi'\nelse\n  puts 'bye'\nend</code></pre>")

end