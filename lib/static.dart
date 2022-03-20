class Holder {
  static String uid = '';

  static void setUid(newUid) {
    uid = newUid;
  }

  static String getUid() {
    return uid;
  }
}

class GuestCart {
  static List cartItems = [];

  static List getCartItems() {
    return cartItems;
  }

  static bool findDuplicateItem(pid) {
    bool found = false;
    print(cartItems);
    cartItems.forEach(
      (item) {
        if (item['pid'] == pid) {
          found = true;
        }
      },
    );

    return found;
  }

  static void addItemToCart(pid) {
    // List tempItems = getCartItems();
    if (findDuplicateItem(pid)) {
      cartItems.forEach((item) {
        if (item['pid'] == pid) {
          item['cnt'] = item['cnt'] + 1;
        }
      });
    } else {
      Map item = {
        'pid': pid,
        'cnt': 1,
      };
      cartItems.add(item);
    }
  }

  static List singleItemCheckOut(pid) {
    Map item = {
      'pid': pid,
      'cnt': 1,
    };

    cartItems.add(item);

    return cartItems;
  }

  static void removeItemFromCart(pid) {
    if (findDuplicateItem(pid)) {
      cartItems.forEach(
        (element) {
          if (element['pid'] == pid) {
            cartItems.remove(element);
          }
        },
      );
    }
  }
}
