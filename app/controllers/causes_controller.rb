class CausesController < ApplicationController
  def index
  end

  def show
    @causes = {
      human_rights_campaign: "The Human Rights Campaign is the largest Civil Rights organization working towards LGBT equality.  Since 1980, HRC has been organizing grassroots movements and lobbying in Washington to reach the goal of equality for all US citizens.  With more than 1.5 Million supporters and volunteers around the world,  C4 is proud to partner with an organization as important as HRC that fights to protect individuality.  Their work truly inspires us as we feel that the issues they are facing will define our generation for years to come.",
      captain_planet_foundation: "The Captain Planet Foundation is a truly unique charity.  Through generous donations, CPF is able to award grants to young people that are trying to make a positive impact on their communities through environmental projects.  CPF has funded over 3,000 unique projects all around the world.  We at C4 strive to be an environmentally-sustainable business.  The CPF not only makes a huge impact on our environment but they do so by empowering the next generation to make a difference.",
      boys_and_girls_club_of_america: "The Boys and Girls club of America inspires and enables all young people to realize their full potential as productive, responsible, and caring citizens. BGCA provides a safe place to learn and grow; ongoing relationships with caring, adult professionals; life-enhancing programs and character development experiences; and hope and opportunity. C4 Understands the importance of investing in future generations. With the help from BGCA, young people have a greater chance of a safe and happy future.",
      best_friends_animal_society: "The Best Friends Animal Society is an animal welfare organization with a No Kill policy. BFAS works nationwide in outreach programs with shelters, other rescue groups and members to promote pet adoption, spay-and-neuter services, and humane education programs. C4 believes in the physical and psychological well-being of animals. In 30 years, BFAS has helped reduce the amount of unnecessary animal deaths from 17 million/year to 4 million/year, and C4 looks forward to seeing this number continue to decrease."
    }

    @asset_mapping = {
      "Boys & Girls Club Of America" => "boys-and-girls-club.png",
      "Captain Planet Foundation" => "planet.png",
      "Best Friends Animal Society" => "bfaslogo.png",
      "Human Rights Campaign" => "hrc2.png"
    }
  end
end
