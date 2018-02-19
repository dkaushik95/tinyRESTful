class ApiController < ApplicationController
  def getdatafromurl
  	# Use this for getting the content from the url
  	require 'open-uri'
  	begin
	  	# Getting the url from parameters
	  	@url = params[:url]

	  	@doc = Nokogiri::HTML(open(@url))
	  	# Getting the first h1
	  	@h1s = @doc.search('h1')[0]
	  	if @h1s
	  		@h1s = @h1s.content
	  	end

	  	# Getting the first h2
	  	@h2s = @doc.search('h2')[0]
	  	if @h2s
	  		@h2s = @h2s.content
	  	end

	  	# Getting the first h3
	  	@h3s = @doc.search('h3')[0]
	  	if @h3s
	  		@h3s = @h3s.content
	  	end

	  	# Getting all the links in the webpage
	  	@l = @doc.css('a').map { |link| link['href'] }
	  	@datt = {
	  		'h1' => @h1s,
	  		'h2' => @h2s,
	  		'h3' => @h3s,
	  		'links' => @l
	  	}

	  	@obj = Datum.new(:url => @url, :h1 => @h1s, :h2 => @h2s, :h3 => @h3s, :links => @l)
	  	@obj.save
	  	# Showing the results as a JSON. 
	  	render json: JSON(@datt)
	  rescue => e
	  	@err = "Either the url is not provided or the url is malfunctioned" + e.to_s
	  	render json: {
		  error: @err,
		  status: 400
		}, status: 400
	  end
  end

  def geturls
  	@dat = Datum.all
  	render json: @dat
  end
end
