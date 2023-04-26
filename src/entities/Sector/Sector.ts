import { v4 } from 'uuid'

class Sector {
  id: string
  name: string

  constructor(props: Omit<Sector, 'id'>, id?: string) {
    Object.assign(this, props)

    if (!id) {
      this.id = v4()
    }
  }
}

export { Sector }
