dumper = Ferry::Dumper.new

Dir.chdir("spec") unless Dir.pwd.split('/').last == "spec"

describe "dumper" do
  describe "sqlite3" do
    # TODO
    # given some application with a sqlite3 database
    # make sure that we successfully export (dump) that database content to a file
    # but how to measure that it was a success or not?
    # number of records?
    # content?
  end
  describe "postgresql" do
  end
  describe "mysql2" do
  end
end
