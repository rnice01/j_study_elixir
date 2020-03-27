defmodule JStudyBlog.Dictionary.Vocab do
  use Ecto.Schema
  import Ecto.Changeset

  schema "vocabs" do
    field :kana, :string
    field :kanji, :string
    has_many :meanings, JStudyBlog.Dictionary.VocabMeaning
    many_to_many :parts_of_speech, JStudyBlog.Dictionary.PartOfSpeech, join_through: "vocab_parts_of_speech"
    belongs_to :primary_kanji, JStudyBlog.Dictionary.Vocab
    has_many :alternate_kanji, JStudyBlog.Dictionary.Vocab, foreign_key: :primary_kanji_id
    timestamps()
  end

  @doc false
  def changeset(vocab, attrs) do
    vocab
    |> cast(attrs, [:kanji, :kana])
    |> validate_required([:kanji, :kana])
  end
end