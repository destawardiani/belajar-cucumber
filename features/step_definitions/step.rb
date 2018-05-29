Given(/^di halaman google$/) do
	visit ''
end

Then(/^harusnya di halaman google$/) do
	puts page.current_url
	raise 'salah halaman' unless page.current_url =~ /www.google.com/
end
