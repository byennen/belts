class CausesController < ApplicationController
  def index
  end

  def show
    @causes = {
      "boys-&-girls-club-of-america" => {
        name: "Boys & Girls Club of America",
        text: "The Human Rights Campaign is the largest Civil Rights organization working towards LGBT equality.  Since 1980, HRC has been organizing grassroots movements and lobbying in Washington to reach the goal of equality for all US citizens.  With more than 1.5 Million supporters and volunteers around the world,  C4 is proud to partner with an organization as important as HRC that fights to protect individuality.  Their work truly inspires us as we feel that the issues they are facing will define our generation for years to come.",
        image: "boys-and-girls-club.png",
        belt_color: "Baby Blue",
        buckle_color: "White"
      },
      "captain-planet-foundation" => {
        name: "Captain Planet Foundation",
        text: "The Captain Planet Foundation is a truly unique charity.  Through generous donations, CPF is able to award grants to young people that are trying to make a positive impact on their communities through environmental projects.  CPF has funded over 3,000 unique projects all around the world.  We at C4 strive to be an environmentally-sustainable business.  The CPF not only makes a huge impact on our environment but they do so by empowering the next generation to make a difference.",
        image: "planet.png",
        belt_color: "Turquoise",
        buckle_color: "Red"
      },
      "best-friends-animal-society" => {
        name: "Best Friends Animal Society",
        text: "The Best Friends Animal Society is an animal welfare organization with a No Kill policy. BFAS works nationwide in outreach programs with shelters, other rescue groups and members to promote pet adoption, spay-and-neuter services, and humane education programs. C4 believes in the physical and psychological well-being of animals. In 30 years, BFAS has helped reduce the amount of unnecessary animal deaths from 17 million/year to 4 million/year, and C4 looks forward to seeing this number continue to decrease.",
        image: "bfaslogo.png",
        belt_color: "Burnt Orange",
        buckle_color: "Black"
      },
      "human-rights-campaign" => {
        name: "Human Rights Campaign",
        text: "The Human Rights Campaign is the largest Civil Rights organization working towards LGBT equality.  Since 1980, HRC has been organizing grassroots movements and lobbying in Washington to reach the goal of equality for all US citizens.  With more than 1.5 Million supporters and volunteers around the world,  C4 is proud to partner with an organization as important as HRC that fights to protect individuality.  Their work truly inspires us as we feel that the issues they are facing will define our generation for years to come.",
        image: "hrc2.png",
        belt_color: "Blue",
        buckle_color: "Yellow"
      }
    }
    @cause = @causes[params[:cause]]
    @belt_url = Belt.find_by_name(@cause[:belt_color]).image.url
    @buckle_url = Buckle.find_by_name(@cause[:buckle_color]).image.url
  end
end
