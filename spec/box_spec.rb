describe Box do
   it 'stores its owners name' do
     my_box = Box.new("Irina", "Seitz")
     expect(my_box.owner.first_name).to eq('Irina')
   end
 end
