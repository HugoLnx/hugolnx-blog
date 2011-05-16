//Criar mais classes para separar mais as responsabilidades
describe "CommentDiv"
  describe "Static"
    describe "Method argsFrom(commentDivElement)"
      describe "Integrations"
        it "should call ToShowBitABit.argsFrom(contentElement)"
          ToShowBitABit.should_receive("argsFrom")
          CommentDiv.argsFrom($(fixture("comment_div")))
        end
      end

      describe "Behavior"
        it "should catch args from comment div"
          var args = CommentDiv.argsFrom($(fixture("comment_div")))
          args.should.have_property "div"
          args.should.have_property "textarea"
          args.should.have_property "show"

          args["div"].should_not.be_null
          args["textarea"].should_not.be_null
          args["show"].should_not.be_null
        end
      end
    end
  end

  describe "Instance"
    before_each
      args = CommentDiv.argsFrom($(fixture("comment_div")))
      commentDiv = new CommentDiv(args)
    end


    describe "Method showMoreCharacters(quantity)"
      describe "Integrations"
        it "should call textarea.showMoreCharacters()"
          args["textarea"].should_receive("showMoreCharacters").with_args(100)

          commentDiv.showMoreCharacters(100)
        end

        it "should call textarea.isFullyVisible()"
          args["textarea"].should_receive("isFullyVisible")

          commentDiv.showMoreCharacters(100)
        end
      end

      describe "Behavior"
        it "should hide show element when all characters has been showed"
          stub(args["textarea"],"isFullyVisible").and_return(true)

          commentDiv.showMoreCharacters(100)

          args["show"].css("display").should.be "none"
        end
      end
    end

  end
end
