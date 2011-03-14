describe "Post Slider"
  before
    sliderElement = $(document.createElement("div"))
    noticeElement = $(document.createElement("div"))
    titleElement = $(document.createElement("div"))
    slider = new PostSlider(
    {
      element: sliderElement,
      noticeElement: noticeElement,
      titleElement: titleElement,
      max: 2,
      titles: ["Testing Post 1","Testing Post 2"]
    })
  end

  it "should update value"
    slider.updateValueWith(2)
    sliderElement.slider("value").should.be 2
  end
end
