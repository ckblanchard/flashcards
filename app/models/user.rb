class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :organization_id, :guess_id
  # attr_accessible :title, :body

  belongs_to :organization
  has_many :guesses
  
  def name
    "#{first_name} #{last_name}"
  end
  
# percentage correct guesses for user for particular deck
  def user_deck_statistics(user, deck)
    total_user_guesses = 0
    total_user_correct = 0

    deck.cards.each do |card|
      card.guesses.each do |guess|
        if guess.user_id == user.id
          total_user_guesses += 1          
          if guess.correct
          total_user_correct += 1
          end
        end
      end
    end
    
    #calculate percentage
  	unless total_user_guesses == 0
      percent_correct_for_deck = (total_user_correct / total_user_guesses.to_f * 1000).to_i/10.to_f
      "#{percent_correct_for_deck}% (#{total_user_correct} / #{total_user_guesses})"
    else
      "No guesses yet"
    end
  end #user_deck_statistics(user, deck)

# percentage correct guesses for user for particular card
  def user_card_statistics(user, card)
    total_user_card_guesses = 0
    total_user_card_guesses_correct = 0

      card.guesses.each do |guess|
        if guess.user_id == user.id
          total_user_card_guesses += 1          
          if guess.correct
          total_user_card_guesses_correct += 1
          end
        end
      end
      
    #calculate percentage
  	unless total_user_card_guesses == 0
      percent_correct_for_card = (total_user_card_guesses_correct / total_user_card_guesses.to_f * 1000).to_i/10.to_f
      "#{percent_correct_for_card}% (#{total_user_card_guesses_correct} / #{total_user_card_guesses})"
    else
      "No guesses yet"
    end
  end
  
# percentage correct for all guesses for particular user
  def user_total_statistics(user)
    all_user_guesses = user.guesses.count
    all_user_guesses_correct = 0
    
    user.guesses.each do |guess|
      if guess.correct
        all_user_guesses_correct += 1
      end
    end
      
    #calculate percentage
  	unless all_user_guesses == 0
      total_percent_correct_for_user = (all_user_guesses_correct / all_user_guesses.to_f * 1000).to_i/10.to_f
      "#{total_percent_correct_for_user}% (#{all_user_guesses_correct} / #{all_user_guesses})"
    else
      "No guesses yet"
    end
  end

end









