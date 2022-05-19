/*if (isValid) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Submitted Successfully"),
                            content: const Text(
                                "You input data has been recorded successfully"),
                            actions: [
                              Center(
                                child: ElevatedButton(
                                  child: const Text(
                                    "Ok",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  onPressed: () {
                                    emailController.clear();
                                    passController.clear();
                                    Navigator.pop(context, true);
                                  },
                                ),
                              ),
                            ],
                            backgroundColor: Colors.green,
                          );
                        });
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Data Not Submitted"),
                            content: const Text(
                                "You input data has not been recorded successfully, submit again?"),
                            actions: [
                              Center(
                                child: ElevatedButton(
                                  child: const Text(
                                    "Ok",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pop(context, true);
                                    });
                                  },
                                ),
                              ),
                            ],
                            backgroundColor: Colors.redAccent,
                          );
                        });
                  }*/