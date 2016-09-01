require 'spec_helper'

feature 'attack player' do
  scenario 'click attack button' do
    sign_in_and_play
    click_button('Attack!')
    expect(page).to have_content 'Dave: 60HP vs. Mittens: 50HP'
  end

  scenario 'reduce Player 2 HP by 10' do
    sign_in_and_play
    click_button 'Attack!'
    expect(page).not_to have_content 'Mittens: 60HP'
    expect(page).to have_content 'Mittens: 50HP'
  end
end
