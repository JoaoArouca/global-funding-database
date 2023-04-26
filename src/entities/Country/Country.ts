import { v4 } from 'uuid'

class Country {
  id: string
  name: string

  constructor(props: Omit<Country, 'id'>, id?: string) {
    Object.assign(this, props)

    if (!id) {
      this.id = v4()
    }
  }
}

export { Country }
