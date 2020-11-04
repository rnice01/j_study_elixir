defmodule JaStudyTools.DictionaryTest do
  use JaStudyTools.DataCase
  import JaStudyTools.Testing.Factory

  alias JaStudyTools.Dictionary

  describe "finding kanji" do
    test "finding kanji by vocab word" do
      insert(:kanji, character: "綺")
      insert(:kanji, character: "麗")

      result = Dictionary.find_kanji_by_characters("綺麗") 
      |> Enum.reduce([], fn k, res -> 
        res ++ [k.character]
      end)

      assert result == ["綺", "麗"]
    end
  end

  describe "searching vocab" do
    test "finding by exact kanji" do
      vocab = insert(:vocab, kanji_reading: "一生懸命")

      [result] = Dictionary.search_vocab!("一生懸命")

      assert result.id == vocab.id
    end

    test "finding by partial kanji" do
      vocab1 = insert(:vocab, kanji_reading: "一生懸命")
      vocab2 = insert(:vocab, kanji_reading: "一生")

      result = Dictionary.search_vocab!("一生") |> Enum.reduce([], fn v, res -> res ++ [v.id] end)

      assert [vocab1.id, vocab2.id] == result
    end

    test "finding by meaning" do
    end
  end
end
