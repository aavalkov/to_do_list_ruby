require 'rspec'
require 'task'
require 'list'

describe Task do
  it 'is initialized with a description' do
    test_task = Task.new('scrub the zebra')
    test_task.should be_an_instance_of Task
  end
  it 'lets you read the description out' do
    test_task = Task.new('scrub the zebra')
    test_task.description.should eq 'scrub the zebra'
  end
end

describe List do
  it 'is initialized with a description' do
    test_list = List.new('home')
    test_list.should be_an_instance_of List
  end
  it 'lets you read the description out' do
    test_list = List.new('home')
    test_list.description.should eq 'home'
  end
  it 'takes tasks for each list' do
    test_list = List.new('home')
    test_list.add_task('new').should eq ['new']
  end
end
