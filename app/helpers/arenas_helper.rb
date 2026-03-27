module ArenasHelper
  def arena_image_for(arena)
    filenames = {
      "American Airlines Center" => "american-airlines-center.avif",
      "Ball Arena" => "ball-arena.webp",
      "Barclays Center" => "barclays-center.avif",
      "Capital One Arena" => "capital-one-arena.webp",
      "Chase Center" => "chase-center.webp",
      "Crypto.com Arena" => "crypto-com-arena.avif",
      "Delta Center" => "delta-center.avif",
      "FedExForum" => "fedex-forum.jpg",
      "Fiserv Forum" => "fiserv-forum.webp",
      "Footprint Center" => "footprint-center.avif",
      "Frost Bank Center" => "frost-bank-center.webp",
      "Gainbridge Fieldhouse" => "gainbridge-fieldhouse.avif",
      "Golden 1 Center" => "golden1-center.webp",
      "Intuit Dome" => "intuit-dome.jpeg",
      "Kaseya Center" => "kaseya-center.avif",
      "Kia Center" => "kia-center.avif",
      "Little Caesars Arena" => "little-caesars-arena.avif",
      "Madison Square Garden" => "madison-square-garden.avif",
      "Moda Center" => "moda-center.avif",
      "Paycom Center" => "paycom-center.avif",
      "Rocket Mortgage FieldHouse" => "rocket-mortgage-fieldhouse.webp",
      "Scotiabank Arena" => "scotiabank-arena.avif",
      "Smoothie King Center" => "smoothie-king-center.jpg",
      "Spectrum Center" => "spectrum-center.webp",
      "State Farm Arena" => "state-farm-arena.avif",
      "Target Center" => "target-center.avif",
      "TD Garden" => "td-garden.avif",
      "Toyota Center" => "toyota-center.webp",
      "United Center" => "united-center.jpeg",
      "Wells Fargo Center" => "wells-fargo-center.avif"
    }

    filenames[arena.name]
  end
end
