from ..model.Database import IConstants as I

class QueriesController:

    def __init__(self, pView, pModel):

        self.view = pView
        self.model = pModel

        # Defining the data
        self.queries = {
            'Recently Seen': I.PRODUCTS_SEEN,
            'Sold Products': I.PRODUCTS_SOLD,
            'Purchases by category': I.PURCHASE_BY_CATEGORY
        }

        if self.model.connectedUser.isAdmin:
            # self.queries[]
            pass

        for query in self.queries:
            # self.view.