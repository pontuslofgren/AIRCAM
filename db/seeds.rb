# CAMERAS

brands = ['Nikon', 'Sony', 'GoPro', 'Canon', 'Hasselblad', 'FujiFilm']

titles = [
  'Please rent my camera',
  'Perfect camera for wedding photographers',
  'Cheap adventure camera for rent',
  'High quality DSLR camera',
  'Exclusive vintage camera'
]

descriptions = [
  "This camera, with its advanced autofocus system, is perfect for capturing fast-moving subjects. Its high-speed continuous shooting mode makes it ideal for wildlife photography, especially for birds in flight or animals on the move. The robust weather sealing ensures it can withstand challenging outdoor conditions, perfect for nature enthusiasts. Additionally, the high-resolution sensor guarantees crisp, detailed images, even in low-light environments. Its ergonomic design and intuitive controls make it easy to handle during long photography sessions.",
  "Experience the excellence of this camera, known for its exceptional low-light performance. Ideal for astrophotography or capturing the northern lights, its high ISO range allows for stunning night-time shots with minimal noise. The full-frame sensor ensures superior image quality and dynamic range, capturing every subtle nuance of twilight. The camera also boasts a time-lapse feature, allowing you to create breathtaking videos of starry skies. Its compact design makes it a great travel companion for all your night photography adventures.",
  "Discover the world of macro photography with this camera, featuring a dedicated macro mode that brings out the finest details in your subjects. Whether it’s intricate textures of flowers or the delicate wings of an insect, the camera captures it all with precision. The image stabilization system ensures sharp, clear images even at close distances. Its touchscreen LCD allows for easy focus point selection, enhancing your macro photography experience. This camera is a must-have for anyone looking to explore the tiny wonders of nature.",
  "Elevate your portrait photography with this camera, renowned for its stunning skin-tone reproduction and beautiful bokeh effect. The portrait mode enhances facial features while smoothly blurring the background, creating professional-grade images. Its eye-detection autofocus locks onto the subject’s eyes, ensuring sharp focus where it matters most. The camera’s high-resolution sensor captures every detail, from individual hair strands to the subtlest expressions, making it ideal for fashion shoots, family portraits, or professional headshots.",
  "This camera is a filmmaker’s dream, offering 4K video recording with advanced stabilization for smooth, cinematic footage. Its wide dynamic range ensures balanced exposure in varied lighting conditions, perfect for outdoor filmmaking. The built-in microphone captures clear audio, while the external mic input allows for professional sound recording. The camera’s compact size and lightweight design make it ideal for vloggers and indie filmmakers who need a reliable, portable solution for their creative projects.",
  "For those interested in sports photography, this camera is a game-changer. Its fast shutter speed freezes action without blur, capturing every thrilling moment in sharp detail. The burst mode allows for high-speed continuous shooting, so you never miss a crucial play. The robust build can withstand the rigors of a sports environment, and the extended battery life ensures you can shoot throughout the entire event without interruption. Its high frame rate video recording is perfect for analyzing techniques or creating slow-motion highlights.",
  "This camera is a travel photographer’s best friend, offering a versatile zoom range that covers wide-angle to telephoto shots. Whether you’re capturing sprawling landscapes or zooming in on distant landmarks, the lens delivers sharp, vibrant images. Its GPS tagging feature records your location, making it easy to track your travel photography journey. The camera’s lightweight and compact design makes it easy to carry around all day, while the built-in Wi-Fi allows for instant photo sharing with friends and family.",
  "Ideal for studio photography, this camera delivers consistent, high-quality images with its accurate color reproduction and wide dynamic range. The tethering capability allows for immediate viewing and editing on a connected device, streamlining your workflow. Its large sensor captures fine detail, essential for product photography and high-fashion shoots. The camera also features a silent shooting mode, perfect for capturing images in a sound-sensitive environment like a movie set or a quiet studio."
]

addresses_in_lisbon = [
  'Rua das Flores 123, 1200-195 Lisboa, Portugal',
  'Avenida da Liberdade 456, 1250-096 Lisboa, Portugal',
  'Praça do Comércio 789, 1100-148 Lisboa, Portugal',
  'Largo do Chiado 101, 1200-108 Lisboa, Portugal',
  'Rua de São Bento 202, 1200-821 Lisboa, Portugal',
  'Avenida Almirante Reis 303, 1150-013 Lisboa, Portugal',
  'Campo de Santa Clara 404, 1100-472 Lisboa, Portugal',
  'Rua Augusta 505, 1100-051 Lisboa, Portugal',
  'Praça Luís de Camões 606, 1200-243 Lisboa, Portugal',
  'Calçada da Graça 707, 1170-165 Lisboa, Portugal'
]

puts "Starting seed"
puts "Remember to at least have one registered user before seeding"

20.times do |i|
  camera = Camera.new
  camera.title = titles.sample
  camera.description = descriptions.sample
  camera.brand = brands.sample
  camera.location = addresses_in_lisbon.sample
  camera.price = (10..100).to_a.sample
  camera.owner_id = User.all.sample.id
  if camera.save
    puts "Successfully created camera with id: #{camera.id}"
  else
    puts camera.errors
  end
end

puts "Done ✅"
