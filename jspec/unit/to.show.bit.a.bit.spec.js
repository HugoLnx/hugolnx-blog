describe "ToShowBitABit"
  describe "Static"
    describe "Method argsFrom(contentElement)"
      describe "Behavior"
        it "should prepare args from contentElement"
          var commentDivElement = $(fixture("comment_div"))
          var contentElement = commentDivElement.children(".content")
          var args = ToShowBitABit.argsFrom(contentElement)
          args.should.have_property("content")
          args.should.have_property("invisibleContent")

          args["content"].should_not.be_null
          args["invisibleContent"].should_not.be_null

          args["content"].text().should.be_empty
          args["invisibleContent"].text().should_not.be_empty
        end
      end
    end
  end

  describe "Instance"
    before_each
      var commentDivElement = $(fixture("comment_div"))
      var contentElement = commentDivElement.children(".content")
      args = ToShowBitABit.argsFrom(contentElement)
      textarea = new ToShowBitABit(args)
    end

    describe "Method showMoreCharacters(quantity)"
      describe "Behavior"
        it "should pass characters from invisibleContent to content"
          args["invisibleContent"].text("12345")

          textarea.showMoreCharacters(5)

          args["content"].text().should.be "12345"
          args["invisibleContent"].text().should.be ""
        end

        it "should update the number of rows to fit the new characters in your textbox"
          args["invisibleContent"].text("123456")
          args["content"].attr("cols",2)

          textarea.showMoreCharacters(100)

          args["content"].attr("rows").should.be 2
        end
      end
    end

    describe "Method isFullyVisible()"
      describe "Behavior"
        it "should know when its fully visible"
          args["invisibleContent"].text("")
          textarea.isFullyVisible().should.be true
        end
      end
    end
  end
end
