require 'spec_helper'

describe SearchController do

  before(:each) do
    nz = Country.create(name: 'New Zealand')
    canada = Country.create( name: 'Canada')

    on = Jurisdiction.create(name: 'Ontario', country_id: canada.id, kind: 'province')

    wai = Jurisdiction.create(name: 'Waikato', country_id: nz.id, kind: 'region')
    nel = Jurisdiction.create(name: 'Nelson', country_id: nz.id, kind: 'region')
    wel = Jurisdiction.create(name: 'Wellington', country_id: nz.id, kind: 'region')

    hamon = City.create(name: 'Hamilton', jurisdiction_id: on.id)
    hamwai = City.create(name: 'Hamilton', jurisdiction_id: wai.id)

    nel = City.create(name: 'Nelson', jurisdiction_id: nel.id)
    welly = City.create(name: 'Wellington', jurisdiction_id: wel.id)
    rag = City.create(name: 'Raglan', jurisdiction_id: wai.id)

    ginny = User.create(name: "Ginny Weasley", email: "ginnyginger@hotmail.com")
    ginny2 = User.create(name: "Ginny Weasley", email: "g.weasley@harvard.edu")
    harry1 = User.create(name: "Harry Smith", email: "harrysmith@gmail.com")
    harry2 = User.create(name: "Harry Smith-Jones", email: "hsjones@gmail.com")
    harry3 = User.create(name: "Harry Johnson", email: "hjohnson@example.com")
    hpotter = User.create(name: "Harry Potter", email: "boywholived@gmail.com")
    percy = User.create(name: "Percy Weasley", email: "stillaprefect@gmail.com")

    addr1 = Address.create(user_id: ginny.id, street_number: 123, street_name: "Fake Street", suburb_name: "Otowhai", rural_delivery: "RD1", city_id: hamwai.id, post_code: '4951')
    addr2 = Address.create(user_id: hpotter.id, street_number: 123, street_name: "Fake Street", suburb_name: "Otowhai", rural_delivery: "RD1", city_id: hamwai.id, post_code: '4951')
    addr3 = Address.create(user_id: percy.id, street_number: 23, street_name: "Spruce Road", suburb_name: "Pineview", rural_delivery: "", city_id: hamon.id, post_code: 'G3W 4K1')

    addr3 = Address.create(user_id: harry1.id, apartment_number: 12, street_number: 44, street_name: "Petunia Street", suburb_name: "Petone", city_id: welly.id, post_code: '4022')

    add4 = Address.create(user_id: harry2.id, apartment_number: 1, street_number: 864, street_name: "Government Road", city_id: rag.id, post_code: '3221')
    add5 = Address.create(user_id: harry3.id, street_number: 2, street_name: 'Waitangi Road', city_id: nel.id, post_code: '8098')
  end

  describe "Searches" do
    it "should return user results by name" do

      get :results, query: 'Ginny Weasley'
      response.code.should eq('200')
      result = JSON.parse(response.body)

      result.size.should == 2
    end

    it "should return country results by name" do

      get :results, query: 'Canada'
      response.code.should eq('200')
      result = JSON.parse(response.body)

      result.size.should == 2
    end

    it "should return an empty set if there are no results" do

      get :results, query: 'asdlfjksldfjkdsf'
      response.code.should eq('200')
      result = JSON.parse(response.body)

      result.size.should == 0
    end

    it "should return user results by attribute" do

      get :results, query: 'Percy Weasley, country='
      response.code.should eq('200')
      result = JSON.parse(response.body)

      result.size.should == 1
    end

    it "should return a set to a broad query" do
      get :results, query: 'Ginny, country=Canada'
      response.code.should eq('200')
      result = JSON.parse(response.body)

      result.size.should == 2
    end

    it "should return correct results even if one of the terms is nonsense" do
      get :results, query: 'Ruth Ablett, btfsplk'
      response.code.should eq('200')
      result = JSON.parse(response.body)

      result.size.should == 1
    end

    it "should return an empty set if the query doesn't make sense" do
      get :results, query: 'country=canada, Alberta'
      response.code.should eq('200')
      result = JSON.parse(response.body)

      result.size.should == 0
    end

  end
end

