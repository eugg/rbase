module ApplicationHelper
  def default_meta_tags
    {
      title: "Rbase Blog",
      description: "Test Test",
      keywords: "Site, Login, Members",
      og: {
        image: "http://www.goodwp.com/large/201104//17163.jpg"
      }
    }
  end
end
