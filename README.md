# Testplan-langchain-playbook
This a chat playbook based on LangChain to see how I can talk to the opensource TestPlan documentation. 
It is based on https://github.com/gkamradt/langchain-tutorials/blob/main/data_generation/Ask%20A%20Book%20Questions.ipynb
The data used here is acessible [TestPlan Documentation](https://testplan.readthedocs.io/en/latest/) owned by Morgan Stanley.

# What you need

- Pinecone: the selected vector database. It was used in the example and provides a simple python client.
- OpenAI API key: This costs some money, so be careful

## Pinecone:
Once you register, you need to create a index called testplan. The size of the vectors need to be 1536. That is only what you need to set.
Under the API Keys, you will find your API key. Make sure to wait for the index to initialize.

# What this does

1. It scrapes the OpenSource [TetsPlan documentation site](https://testplan.readthedocs.io/en/latest) to gather all links inside that points to a html file with the same base url. 
2. Passes that to the Langchain UnstructuredURLLoader to load the data
3. Splits the text into chunks
4. Embeds all the data and pushes it to the pinecone database.

Once this is done, you can create your query. E.g.: "What python versions are supported by testplan?"

With the OpenAI embedding endpoint, we also embed the question and proceed to do a similarity search which is a comparison of the query embedding and the stored documentations' embedding on Pinecone.

When we have the most similar documentation parts from the database, we can pass that to the chain as the context of our question, which it should use to answer it.

Note that this is hardly scracthing the surface of what is possible.
If you are interested, you can read more about it on the [LangChain documentation](https://docs.langchain.com/docs/) or check out [gkamradt's langchain cookbook](https://github.com/gkamradt/langchain-tutorials/blob/main/LangChain%20Cookbook.ipynb)
