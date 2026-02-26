def transmit_witness():
    if not os.path.exists(LOG_DIR):
        os.makedirs(LOG_DIR)

    state = get_radiant_state()

    with open(LOG_FILE, "w") as f:
        json.dump(state, f, indent=2)

    print(f"Witness: State collected at {state['timestamp']}")
    os.system("git add .")
    os.system(f'git commit -m "Witness transmission: {state["status"]}"')
    os.system("git push origin main")

if __name__ == "__main__":
    transmit_witness()
