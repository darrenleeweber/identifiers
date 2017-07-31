module Identifiers
  class ArxivId
    def self.extract(str)
      extract_pre_2007_arxiv_ids(str) + extract_post_2007_arxiv_ids(str)
    end

    def self.extract_post_2007_arxiv_ids(str)
      str
        .to_s
        .scan(%r{(?<=^|[[:space:]/])(?:arXiv:)?\d{4}\.\d{4,5}(?:v\d+)?(?=$|[[:space:]])}i)
        .map { |arxiv_id| arxiv_id.sub(/\AarXiv:/i, '') }
    end

    def self.extract_pre_2007_arxiv_ids(str)
      str
        .to_s
        .scan(%r{(?<=^|[[:space:]/])(?:arXiv:)?[a-z-]+(?:\.[A-Z]{2})?/\d{2}(?:0[1-9]|1[012])\d{3}(?:v\d+)?(?=$|[[:space:]])}i)
        .map { |arxiv_id| arxiv_id.sub(/\AarXiv:/i, '') }
    end
  end
end
