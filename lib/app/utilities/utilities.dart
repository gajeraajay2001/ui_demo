String getPropertyListingType({required String type}) {
  if (type == "R") {
    return "Room";
  } else {
    return "Whole property";
  }
}

String getPropertyType({required String type}) {
  if (type == "F") {
    return "Flat";
  } else {
    return "House";
  }
}

String getRoomType({required String type}) {
  if (type == "SR") {
    return "Single Room";
  } else {
    return "Single Room";
  }
}

String getMoveInDate({required String type}) {
  if (type == "an") {
    return "Available now";
  } else {
    return "Future";
  }
}

String getLengthOfStay({required String type}) {
  if (type == "SL") {
    return "Sort let";
  } else {
    return "Long let";
  }
}

String getType({required String type}) {
  if (type == "F") {
    return "Furnished";
  } else {
    return "NA";
  }
}

String getIsForStudents({required String type}) {
  if (type == "0") {
    return "No";
  } else {
    return "Yes";
  }
}
